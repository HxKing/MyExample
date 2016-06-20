//
//  KKNews.m
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/4.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "KKNews.h"
#import <MJExtension.h>


@implementation KKNews
@synthesize id = _id;

//- (id)valueForUndefinedKey:(NSString *)key{
//}

@end


@implementation KKLatest

+ (NSDictionary *)mj_objectClassInArray{
    
    return @{@"stories":[KKNews class],
             @"top_stories":[KKNews class]
             };
}

@end

