//
//  KKHttpTool.m
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/4.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "KKHttpTool.h"
#import <AFNetworking.h>



@implementation KKHttpTool

+ (void)get:(NSString *)url

 parameters:(id)parame
    success:(void(^)(id res))success
    failure:(void(^)(NSError *error))failure{
    
    AFHTTPSessionManager *afn = [AFHTTPSessionManager manager];
    
    [afn GET:url parameters:parame progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
    
    
}




@end
