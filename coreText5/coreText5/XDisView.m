//
//  XDisView.m
//  coreText5
//
//  Created by 王亚康 on 16/5/19.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "XDisView.h"
#import <CoreText/CoreText.h>

@implementation XDisView

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 1.0f, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:@"哈哈哈啊哈老师的反馈开始来得及哈哈哈啊哈老师的反馈开始来得及哈哈哈啊哈老师的反馈开始来得及"];
    
    [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:22] range:NSMakeRange(0, 5)];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, 5)];
    
    //创建图片位置
    NSString *taobaoImageName = @"meile.png";
    CTRunDelegateCallbacks imageCallbacks;
    imageCallbacks.version = kCTRunDelegateVersion1;
    imageCallbacks.dealloc = RunDelegateDeallocCallback;
    imageCallbacks.getAscent = RunDelegateGetAscentCallback;
    imageCallbacks.getDescent = RunDelegateGetDescentCallback;
    imageCallbacks.getWidth = RunDelegateGetWidthCallback;
    
    CTRunDelegateRef runDelegate = CTRunDelegateCreate(&imageCallbacks, (__bridge void *)taobaoImageName);
    NSMutableAttributedString *imageAttributedString =[[NSMutableAttributedString alloc]initWithString:@" "];//创建一个空格，来使attributedString生效
    [imageAttributedString addAttribute:(NSString *)kCTRunDelegateAttributeName value:(__bridge id)runDelegate range:NSMakeRange(0, 1)];//设置回调
    CFRelease(runDelegate);
    
    [imageAttributedString addAttribute:@"imageName" value:taobaoImageName range:NSMakeRange(0, 1)];
    [attString insertAttributedString:imageAttributedString atIndex:30];//把attribute 插入到一个特定的位置
    //创建图片位置至此完成那个
    NSLog(@"%@",imageAttributedString);
    NSLog(@"%@",attString);
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0,0), path, NULL);
    CTFrameDraw(frame, context);
    
    // 计算画图
    // 从frame中获取 总行数
    CFArrayRef lines = CTFrameGetLines(frame);
    
    // 获取每一行的原点坐标（draw的坐标系）
    CGPoint lineOrigins[CFArrayGetCount(lines)];
    CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), lineOrigins);
    
    // 获取数组长度 遍历所有lines
    for (int i = 0 ; i<CFArrayGetCount(lines); i++) {
        
        // 获取每一个line
        CTLineRef line = CFArrayGetValueAtIndex(lines, i);
        
        // 这三个数相加可以得到一个行高。可能不准确
        CGFloat lineAscent;
        CGFloat lineDescent;
        CGFloat lineLeading;
        // 返回本行的宽度double
        CTLineGetTypographicBounds(line, &lineAscent, &lineDescent, &lineLeading);
        
        // 获取line 中的所有 run
        CFArrayRef runs = CTLineGetGlyphRuns(line);
        
        for (int j = 0 ; j<CFArrayGetCount(runs); j++) {
           
            CTRunRef run = CFArrayGetValueAtIndex(runs, j);
            NSDictionary *runDic = (NSDictionary *)CTRunGetAttributes(run);
            
            NSLog(@"i:%d,j:%d,%@",i,j,runDic);
            
            NSString *imageName = [runDic objectForKey:@"imageName"];
            
            CGFloat runAscent;
            CGFloat runDescent;
            CGPoint lineOrigin = lineOrigins[i];
            
            CGRect runRect;
            runRect.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &runAscent, &runDescent, NULL);
            
            CGFloat x = lineOrigin.x + CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL);
            CGFloat y = lineOrigin.y - runDescent;
            CGFloat w = runRect.size.width;
            CGFloat h = runAscent + runDescent;
            runRect=CGRectMake(x,y,w,h);
            
            if (imageName) {
                
                UIImage *image = [UIImage imageNamed:imageName];
                if (image) {
                    CGRect imageDrawRect;
                    imageDrawRect.size = image.size;
                    imageDrawRect.origin.x = runRect.origin.x + lineOrigin.x;
                    imageDrawRect.origin.y = lineOrigin.y ;// 怎么精确计算
                    CGContextDrawImage(context, imageDrawRect, image.CGImage);
                }
            }
            
        }
    }
    
    
    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
    
}

void RunDelegateDeallocCallback( void* refCon ){
    
}

CGFloat RunDelegateGetAscentCallback( void *refCon ){
    NSString *imageName = (__bridge NSString *)refCon;
    return [UIImage imageNamed:imageName].size.height;
    //    return 60;
}

CGFloat RunDelegateGetDescentCallback(void *refCon){
    return 0;
}

CGFloat RunDelegateGetWidthCallback(void *refCon){
    NSString *imageName = (__bridge NSString *)refCon;
    return [UIImage imageNamed:imageName].size.width;
}

@end
