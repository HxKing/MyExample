//
//  BezierPathView.m
//  BezierPathDemo
//
//  Created by 王亚康 on 16/5/26.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#define kDegreesToRadians(r) ((3.14159265 * r)/180)

#import "BezierPathView.h"

@implementation BezierPathView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [self drawRoundeRadiusPath];
//    const CGFloat pi = 3.14159265;
    
    
    
    
    
    
}

- (void)drawBezierPath2{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(50, 100)];
    
    [path addCurveToPoint:CGPointMake(300, 100) controlPoint1:CGPointMake(115, 200) controlPoint2:CGPointMake(260, 0)];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineWidth = 5;
    
    UIColor *redColor = [UIColor redColor];
    [redColor set];
    [path stroke];
}

- (void)drawBezierPath{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(100, 100)];
    
    [path addQuadCurveToPoint:CGPointMake(300, 100) controlPoint:CGPointMake(150, 300)];
    
    path.lineWidth = 5;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineCapStyle = kCGLineCapRound;
    
    UIColor *redColor = [UIColor redColor];
    [redColor set];
    [path stroke];
}

- (void)drawArc{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:50 startAngle:0 endAngle:kDegreesToRadians(78) clockwise:NO];
    
    path.lineWidth = 5;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineCapStyle = kCGLineCapRound;
    
    UIColor *redColor = [UIColor redColor];
    [redColor set];
    [path stroke];
}

- (void)drawRoundeRadiusPath{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 100, 100) cornerRadius:20];
    
    path.lineWidth = 5;
    
    UIColor *redColor = [UIColor redColor];
    [redColor set];
    [path stroke];
    
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 300, 100, 100) byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(50, 35)];
    path1.lineWidth = 5;
//    UIColor *redColor = [UIColor redColor];
    [redColor set];
    [path1 stroke];
    
    
    
    
}

// 画圆 和 画 椭圆，取决于Rect
- (void)drawCiclPath{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)];
    
    path.lineWidth = 5;
    
    UIColor *orColor = [UIColor orangeColor];
    [orColor set];
    [path fill];
    
    UIColor *blueColor = [UIColor blueColor];
    [blueColor set];
    [path stroke];

}

- (void)drawRectPath{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 200, 180)];
    path.lineWidth = 3;
    //第一个是默认的表示斜接，第二个是圆滑衔接，第三个是斜角连接。
    //    kCGLineJoinMiter,
    //    kCGLineJoinRound,
    //    kCGLineJoinBevel
    path.lineJoinStyle = kCGLineJoinMiter;
    
    //第一个是默认的，第二个是轻微圆角，第三个正方形。
    //    kCGLineCapButt,
    //    kCGLineCapRound,
    //    kCGLineCapSquare
    path.lineCapStyle = kCGLineCapRound;
    
    UIColor *fillColor = [UIColor redColor];
    [fillColor set];
    [path fill];
    
    UIColor *orColor = [UIColor greenColor];
    [orColor set];
    [path stroke];
}


- (void)drawTrianglePath{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(300, 300)];
    [path addLineToPoint:CGPointMake(300, 150)];
    [path addLineToPoint:CGPointMake(100, (300 - 150)*0.5)];
    
    [path closePath];
    
    path.lineWidth = 1.5;
    
    UIColor *fillcolor = [UIColor greenColor];
    [fillcolor set];
    [path fill];
    
    UIColor *strokecolor = [UIColor blueColor];
    [strokecolor set];
    [path stroke];
}


@end
