//
//  XDisView.m
//  coreText4
//
//  Created by 王亚康 on 16/5/18.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "XDisView.h"

@implementation XDisView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    if (self.data) {
        CTFrameDraw(self.data.ctFrame, context);
    }
    
    
}


@end
