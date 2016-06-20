//
//  UIImage+Extension.m
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/4.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)imageWithColor:(UIColor *)color{
    
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启图形上下文
    UIGraphicsBeginImageContext(rect.size);
    
    // 获取图形上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    // 填充颜色
    CGContextSetFillColorWithColor(ref, [color CGColor]);
    
    // 渲染上下文
    CGContextFillRect(ref, rect);
    
    //  获取图形
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return img;
    
}

@end
