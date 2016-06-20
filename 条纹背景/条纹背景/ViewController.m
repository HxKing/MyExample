//
//  ViewController.m
//  条纹背景
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
    
    // 图片上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.view.frame.size.width, 22), YES, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 设置颜色
    CGContextSetRGBStrokeColor(ctx, 0.7, 0.7, 0.7, 0.7);
    CGContextSetRGBFillColor(ctx, .9, .9, .9, .9);
    
    // 画矩形
    CGContextAddRect(ctx, CGRectMake(0, 0, self.view.frame.size.width, 22));
    CGContextFillPath(ctx);
    // 画线
    CGContextSetRGBStrokeColor(ctx, 1.0, 1.0, 1.0, 0.7);
    CGContextMoveToPoint(ctx, 10, 20);
    CGContextAddLineToPoint(ctx, self.view.frame.size.width - 10, 20);
    CGContextStrokePath(ctx);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
//    NSData *data = UIImagePNGRepresentation(img);
//    [data writeToFile:@"/Users/wangyakang/Desktop/aa.png" atomically:YES];
//    img = [UIImage imageNamed:@"001"];
    
    // 将uiimage转换为uicolor
    UIColor *imgColor = [UIColor colorWithPatternImage:img];
    // 这样设置颜色，图片将会按原样（不伸缩）平铺
    self.view.backgroundColor = imgColor;
    
}

@end
