//
//  ViewController.m
//  svpHudDemo
//
//  Created by 王亚康 on 16/2/22.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"

@interface ViewController ()
- (IBAction)seitchClick:(UISwitch *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)seitchClick:(UISwitch *)sender {
    
    NSLog(@"%d",sender.isOn);
    
    if (sender.isOn) {
        [self gogo];
    }else{
        [self dismissHUD];
    }
    
}

- (void)gogo{

    //    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeNone];
    
    // 设置字体大小
//    [SVProgressHUD setFont:[UIFont systemFontOfSize:17.0]];

    // 显示成功信息
//    [SVProgressHUD showSuccessWithStatus:@"hahhaha成功"];
    
//    [SVProgressHUD showErrorWithStatus:@"失败sadfja"];
    
//    [SVProgressHUD showProgress:.5f];
    
//    [SVProgressHUD showProgress:.5f status:@"请稍等..."];
    
    
    [SVProgressHUD showWithStatus:@"hahhah哈hahhah哈哈hahhah哈哈hahhah哈哈hahhah哈哈哈哈😄"];
    
    // 添加朦板，不可操作，其它控件
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    
    // 黑色背景，可用于，夜间模式
//    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    // 设置动画效果，没看出 有什么区别
//    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(dismissHUD) userInfo:nil repeats:NO];

    
    // 设置为SVProgressHUDStyleCustom，背景颜色，和前景颜色才有效
//    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    
//    [SVProgressHUD setBackgroundColor:[UIColor clearColor]];
    
//    [SVProgressHUD showImage:[UIImage imageNamed:@"king32"] status:@"haha哈哈"];
    
    
//    [SVProgressHUD showInfoWithStatus:@"hahhasdfjksdjf;asdjfka"];
    
//    [SVProgressHUD setStatus:@"hahhah哈哈哈哈哈哈"];
//    [SVProgressHUD show];
}

- (void)dismissHUD{
    
    NSLog(@"%s",__func__);
    
    [SVProgressHUD dismiss];
}

@end
