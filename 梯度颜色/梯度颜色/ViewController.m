//
//  ViewController.m
//  梯度颜色
//
//  Created by 王亚康 on 16/4/12.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  梯度
    CAGradientLayer * layer = [CAGradientLayer layer];
    layer.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor blueColor].CGColor,(id)[UIColor greenColor].CGColor];
    layer.locations = @[@0.2,@0.2,@0.6];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(100, 100);
    layer.startPoint = CGPointMake(0.5, 0);
    layer.endPoint = CGPointMake(0.5, 1);
//    layer.type = kCAGradientLayerAxial;
    [self.view.layer addSublayer:layer];
    
    
//    CAReplicatorLayer *reLayer = [CAReplicatorLayer layer];
//    reLayer.position = CGPointMake(0, 0);
//    
//    CALayer * layer= [CALayer layer];
//    [reLayer addSublayer:layer];
//    [self.view.layer addSublayer:reLayer];
//    layer.bounds = CGRectMake(0, 0, 20, 20);
//    layer.position = CGPointMake(200, 100);
//    layer.backgroundColor = [UIColor redColor].CGColor;
//    //每个副本向右平移25px
//    reLayer.instanceTransform=CATransform3DMakeRotation(M_PI_4*0.2, 1, 1, 0);
//    //如果进行动画，副本延时一秒执行
//    reLayer.instanceDelay = 1;
//    //拷贝十个副本
//    reLayer.instanceCount = 10;
//    reLayer.instanceAlphaOffset = -0.1;
////    reLayer.preservesDepth = YES;
//    //    reLayer.instanceColor = [UIColor blueColor].CGColor;
//
//    CAShapeLayer * layer = [CAShapeLayer layer];
//    layer.position=CGPointMake(0,0);
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, 0, 100, 100);
//    CGPathAddLineToPoint(path, 0, 300, 100);
//    CGPathAddLineToPoint(path, 0, 200, 200);
//    CGPathAddLineToPoint(path, 0, 100, 100);
//    layer.path=path;
//    layer.fillColor= [UIColor redColor].CGColor;
//    layer.fillRule = kCAFillRuleEvenOdd;
//    layer.strokeColor = [UIColor blueColor].CGColor;
//    layer.strokeStart =0;
//    layer.strokeEnd =0.5;
//    layer.lineWidth = 5;
//    layer.miterLimit = 1;
//    layer.lineJoin = kCALineJoinMiter;
//    [self.view.layer addSublayer:layer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
