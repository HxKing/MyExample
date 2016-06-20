//
//  KKNavigationController.m
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/4.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "KKNavigationController.h"
#import "UIBarButtonItem+Extension.h"

@interface KKNavigationController ()

@end

@implementation KKNavigationController

+(void)initialize{
    
    //    83  188 83
    
//    UINavigationBar *bar = [UINavigationBar appearance];
//    
//    bar.barTintColor = [UIColor colorWithRed:83/255.0 green:188/255.0 blue:83/255.0 alpha:1];
//    
//    // bar文字样式
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    dic[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    dic[NSFontAttributeName] = [UIFont systemFontOfSize:22.0];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)backClick{
    [self popViewControllerAnimated:YES];
    
}

@end
