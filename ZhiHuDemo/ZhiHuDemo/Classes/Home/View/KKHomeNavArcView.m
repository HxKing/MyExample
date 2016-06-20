//
//  KKHomeHeaderView.m
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/4.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "KKHomeNavArcView.h"

@implementation KKHomeNavArcView


- (void)setV:(CGFloat)v{
    _v = v;
    
    [self setNeedsDisplay];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(ref, 0.3, 0.3, 0.3, 0.3);
    
    CGContextAddArc(ref, self.width*0.5, self.height*0.5, self.width*0.5, 0,2 * M_PI, 0);
    
    CGContextStrokePath(ref);
    
    
    CGContextSetRGBStrokeColor(ref, 1, 1, 1, 1);
    
    CGContextAddArc(ref, self.width*0.5, self.height*0.5, self.width*0.5, M_PI_2,2 * M_PI * (- self.v /64.0) + M_PI_2, 0);
    
    CGContextStrokePath(ref);
    
    
}


@end
