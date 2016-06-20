//
//  ViewController.m
//  图片水印
//
//  Created by 王亚康 on 16/4/11.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载背景图片
    UIImage *imgBg = [UIImage imageNamed:@"001"];
    // 创建bitmap图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(300, 400), NO, 0);
    // 渲染
    [imgBg drawInRect:CGRectMake(0, 0, 200, 380)];
    
    // 加载水印图片
    UIImage *logo = [UIImage imageNamed:@"logo"];
    // 渲染
    [logo drawInRect:CGRectMake(0, 0, 50, 50)];
    
    // 获取bitmap图形上下文中渲染好的图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    // 将图片专为data，并写入到mac上，便于查看
    NSData *data = UIImagePNGRepresentation(img);
    [data writeToFile:@"/Users/你电脑的名字/Desktop/hhh.png" atomically:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
