//
//  NSString+Extension.m
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/5.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (NSString *)dateToMMddEEE{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh-CH"];
    
    [formatter setDateFormat:@"yyyyMMdd"];
    NSDate *d = [formatter dateFromString:self];
    
    [formatter setDateFormat:@"MM月dd日 EEEE"];
    NSString *s = [formatter stringFromDate:d];
    
    return s;
    
}

@end
