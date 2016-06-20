//
//  KKHomeViewController.m
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/4.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#define herderViewH 180

#import "KKHomeViewController.h"
#import "UIImage+Extension.h"
#import "KKHomeNavArcView.h"
#import "KKHttpTool.h"
#import "KKNews.h"
#import <MJExtension.h>
#import <SDCycleScrollView.h>
#import "KKHomeCell.h"
#import <MJRefresh.h>
#import "NSMutableArray+Extension.h"
#import "KKHomeTableHeaderView.h"

@interface KKHomeViewController ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>{
    BOOL _isRefresh;
    NSRange firstArray;
    
}

/** 内容view */
@property (nonatomic, strong) UITableView *tableView;

/** tableview 上的轮播条view */
@property (nonatomic, strong) SDCycleScrollView *headerView;


@property (nonatomic, strong) UILabel *titleLabel;

/** 动态画圆 */
@property (nonatomic, strong) KKHomeNavArcView *arcView;

/** 菊花 */
@property (nonatomic, strong) UIActivityIndicatorView *activiView;

/** 名字 */
@property (nonatomic, strong) UILabel *nameLable;

/** 数据源 */
@property (nonatomic, strong) NSMutableArray *dataArray;

/** top title str array  */
@property (nonatomic, strong) NSMutableArray *topTitleArray;

/** <#注释#> */
@property (nonatomic, copy) NSString *oldDate;

@property (nonatomic, strong) UIView *naviBar;

@end

@implementation KKHomeViewController

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (NSMutableArray *)topTitleArray{
    if (!_topTitleArray) {
        _topTitleArray = [[NSMutableArray alloc] init];
    }
    return _topTitleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.tableView];
    [self.tableView addSubview:self.headerView];
    [self.view addSubview:self.naviBar];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.arcView];
    
    [self.tableView setRowHeight:80];
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadOldData)];
    
    [self loadNewData];
}

- (void)loadOldData{
    
    NSString *str = [NSString stringWithFormat:@"http://news.at.zhihu.com/api/4/news/before/%@",self.oldDate];
    [KKHttpTool get:str parameters:nil success:^(id res) {
       
        KKLatest *latest = [KKLatest mj_objectWithKeyValues:res];
        self.oldDate = latest.date;

        [self.dataArray addObject:latest];
        
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        
        
    } failure:^(NSError *error) {
        
    }];
    
}

- (void)loadNewData{
    
    [KKHttpTool get:@"http://news-at.zhihu.com/api/4/news/latest" parameters:nil success:^(id res) {

        KKLatest *latest = [KKLatest mj_objectWithKeyValues:res];
        
        self.oldDate = latest.date;
        
        if (self.dataArray.count) {
            [self.dataArray removeObjectAtIndex:0];
        }
        [self.dataArray insertObject:latest atIndex:0];
        
        [self.tableView reloadData];
        
        NSMutableArray *arr = [NSMutableArray array];
        for (KKNews *n in latest.top_stories) {
            [arr addObject:n.image];
            [self.topTitleArray addObject:n.title];
            
        }
        // 网络加载 --- 创建自定义图片的pageControlDot的图片轮播器
        [self.headerView clearCache];
        self.headerView.imageURLStringsGroup = arr;
        self.headerView.titlesGroup = self.topTitleArray;
        [self.activiView stopAnimating];
//        _isRefresh = NO;
        
    } failure:^(NSError *error) {
        [self.activiView stopAnimating];
//        _isRefresh = NO;
        
        KKLog(@"%@",error);
    }];
    
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{

}

#pragma mark - scrollerView deleage
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (!_isRefresh){
        
        if (offsetY < -herderViewH) {
            self.arcView.v = offsetY + herderViewH;
            _arcView.hidden = NO;
        }else{
            _arcView.hidden = YES;
        }
    }
    
    CGFloat offsetH = herderViewH + offsetY;
    
    if (offsetH <= 0) {
        CGRect frame = self.headerView.frame;
        frame.size.height = herderViewH - offsetH;
        frame.origin.y = -herderViewH + offsetH;
        self.headerView.frame = frame;
    }
    
    CGFloat alpha = offsetH / herderViewH;
    _naviBar.alpha = alpha;
    
    if (offsetY>=0) {
        _tableView.contentInset = UIEdgeInsetsMake(20, 0, 40, 0);
    }else{
        _tableView.contentInset = UIEdgeInsetsMake(herderViewH, 0, 0, 0);
    }

    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[kColor(23, 144, 211, 1) colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if (_isRefresh) return;
    
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY<-herderViewH-64) {
        
        self.arcView.hidden = YES;
        _isRefresh = YES;
        
        [_activiView stopAnimating];
        _activiView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        
        [self.view addSubview:_activiView];
        
        _activiView.frame = self.arcView.frame;
        [_activiView startAnimating];
        [self loadNewData];
    }

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY == -herderViewH) {
        _isRefresh = NO;
    }
}

#pragma mark - table view datasouce
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    KKLatest *l = self.dataArray[section];
    NSArray *arr = l.stories;
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KKHomeCell *cell = [KKHomeCell homeCell:tableView];

    KKLatest *l = self.dataArray[indexPath.section];
    NSArray *arr = l.stories;
    KKNews *n = (KKNews *)arr[indexPath.row];
    cell.news = n;
    
    return cell;
    
}

#pragma mark - table view deleage

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    KKHomeTableHeaderView *header = [KKHomeTableHeaderView homeTableHeaderView:tableView];
    
    KKLatest *l = self.dataArray[section];
    header.date = l.date;
    
    return section?header:nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    //    写成0  display  不会在0的section 执行
    return section?35.f:CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (section == 0) {
//        UINavigationBar *bar = self.navigationController.navigationBar;
//        [bar setValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kScreenWidth, 64)] forKeyPath:@"frame"];
         _naviBar.height = 55;
        _titleLabel.alpha = 1;
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (section == 0) {
//        UINavigationBar *bar = self.navigationController.navigationBar;
//        [bar setValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kScreenWidth, 20)] forKeyPath:@"frame"];
         _naviBar.height = 20;
        self.titleLabel.alpha = 0;
    }
}


#pragma mark - 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight-20) style:UITableViewStylePlain];

        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.contentInset = UIEdgeInsetsMake(herderViewH, 0, 0, 0);
    }
    return _tableView;
}

- (SDCycleScrollView *)headerView{
    if (!_headerView) {
        _headerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, herderViewH) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        _headerView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _headerView.contentMode = UIViewContentModeScaleAspectFit;
        _headerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _headerView.currentPageDotColor = [UIColor whiteColor];
        _headerView.titleLabelHeight = 50;
        _headerView.titleLabelTextFont = [UIFont systemFontOfSize:17];
        _headerView.titleLabelBackgroundColor =[UIColor clearColor];
    }
    return _headerView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.attributedText = [[NSAttributedString alloc] initWithString:@"今日热闻" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
        [_titleLabel sizeToFit];
        _titleLabel.centerX = kScreenWidth*0.5;
        _titleLabel.centerY = 37.5;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.alpha = 1;
        
    }
    return _titleLabel;
}

- (KKHomeNavArcView *)arcView{
    if (!_arcView) {
        _arcView = [[KKHomeNavArcView alloc] init];
        _arcView.backgroundColor = [UIColor redColor];
        _arcView.size = CGSizeMake(16, 16);
        _arcView.x = kScreenWidth * 0.5 - (self.titleLabel.width *0.5) - 18 - 3;
        _arcView.centerY = self.titleLabel.centerY;
        _arcView.hidden = YES;
        _isRefresh = NO;
    }
    return _arcView;
}

- (UIView *)naviBar{
    if (_naviBar == nil) {
        _naviBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 55)];
        _naviBar.backgroundColor = kColor(23, 144, 211, 1);
        _naviBar.alpha = 0;
    }
    return _naviBar;
}

@end
