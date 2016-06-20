//
//  ViewController.m
//  截屏
//
//  Created by 王亚康 on 16/4/11.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)btnClick:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(UIButton *)sender {
    
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 将屏幕绘制到上下文中
    [self.view.layer renderInContext:ctx];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    // 将图片保存到相册
    UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}

// 图片保存到相册掉用，固定写法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        NSLog(@"保存失败");
    }else{
        NSLog(@"保存成功");
    }
}

@end
