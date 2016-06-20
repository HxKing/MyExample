//
//  KKSplashControllerViewController.m
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/4.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "KKSplashController.h"
#import <UIImageView+WebCache.h>
#import <MJExtension/MJExtension.h>
#import "KKSplash.h"


static CGFloat const animationDuration = 3.0;

@interface KKSplashController ()

/** 网络获取的图片 */
@property (nonatomic, strong) UIImageView *spImageView;
/** logo */
@property (nonatomic, strong) UIImageView *logoImageView;
/** 说明 */
@property (nonatomic, strong) UILabel *imageTitle;

@end

@implementation KKSplashController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.spImageView];
    // 将一个uiview显示在最前面只需要调用其父视图的 bringsubviewtofront（）方法。
    [self.view bringSubviewToFront:self.spImageView];
    [self.view addSubview:self.imageTitle];
    
    
    [KKHttpTool get:@"http://news-at.zhihu.com/api/4/start-image/1080*1776" parameters:nil success:^(id res) {
        
//        KKLog(@"%@",res);
        
        KKSplash *sp = [KKSplash mj_objectWithKeyValues:res];
        
        SDWebImageManager *manger = [SDWebImageManager sharedManager];
        
        [manger downloadImageWithURL:[NSURL URLWithString:sp.img] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            
            [self.view addSubview:self.logoImageView];
           
            self.spImageView.image = image;
            self.imageTitle.text = sp.text;
            
            [self.imageTitle sizeToFit];
            self.imageTitle.center = CGPointMake(kScreenWidth*0.5, kScreenHeight-30);
            
            [UIView animateWithDuration:animationDuration animations:^{
                self.spImageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
                
            }completion:^(BOOL finished) {
                [self.view removeFromSuperview];
            }];
            
        }];
        
    } failure:^(NSError *error) {
        
    }];
    
    
    
}

- (UIImageView *)spImageView{
    if (!_spImageView) {
        _spImageView = [[UIImageView alloc] initWithFrame:kScreenBounds];
        
        _spImageView.image = [UIImage imageNamed:@"Default"];
    }
    return _spImageView;
}

- (UIImageView *)logoImageView{
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Login_Logo"]];
        _logoImageView.center = CGPointMake(kScreenWidth*0.5, kScreenHeight - 70);
        
    }
    return _logoImageView;
}


- (UILabel *)imageTitle{
    if (!_imageTitle) {
        _imageTitle = [[UILabel alloc] init];
        _imageTitle.textColor = [UIColor whiteColor];
        _imageTitle.font = [UIFont systemFontOfSize:18.0];
        
    }
    return _imageTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
