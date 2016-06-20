

#import "TableViewController.h"
#import "ViewController.h"
#import "ModelDemo.h"

@interface TableViewController ()<UIViewControllerPreviewingDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation TableViewController

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
        
        // 获取路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"infoDemo" ofType:@"plist"];
        
        // 加载数据
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        // 字典转模型
        for (NSDictionary *dic in array) {
            ModelDemo *model = [ModelDemo ModelDemoWithDic:dic];
            [self.dataArray addObject:model];
        }
        
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
//    NSMutableArray *arr = [[NSMutableArray alloc] init];
//
//    for (int i=0; i<20; i++) {
//        NSString *str = [NSString stringWithFormat:@"这里是%d",i];
//        [arr addObject:str];
//    }
    
//    self.dataArray = arr;
    
    NSLog(@"%@",self.dataArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [self.dataArray[indexPath.row] name];
    
    // 告诉系统每一个cell都可以被peek
    [self registerForPreviewingWithDelegate:self sourceView:cell];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    // 取消选中样式
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


#pragma mark - UIViewControllerPreviewingDelegate

// peek
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    
//    NSLog(@"%@ - %@ ",previewingContext,NSStringFromCGPoint(location));
    
    // 转换坐标
    location = [self.tableView convertPoint:location fromView:[previewingContext sourceView]];
    
    // 根据location获取位置
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    
    // 创建控制器
    ViewController *vc = [[ViewController alloc] init];
    
    // 获取点击的cell所对应的模型
    ModelDemo *m = self.dataArray[indexPath.row];
    
    // 将模型中的地址传递给webView（ViewController）
    vc.httpUrl = m.path;
    
    
    return vc;
    
}

// pop
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    
    // 隐藏tabBar
    viewControllerToCommit.hidesBottomBarWhenPushed = YES;
    
    // push peek 所看到的UIViewController
    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
    
}

@end
