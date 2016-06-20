//
//  KKHttpTool.h
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/4.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKHttpTool : NSObject

+ (void)get:(NSString *)url parameters:(id)parame success:(void(^)(id res))success failure:(void(^)(NSError *error))failure;


@end
