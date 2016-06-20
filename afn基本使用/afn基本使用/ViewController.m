//
//  ViewController.m
//  afn基本使用
//
//  Created by 王亚康 on 16/5/16.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>


@interface ViewController ()

@end

@implementation ViewController

// 上传文件
- (void)test{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // http://121.42.204.103/upload.php
    NSString *host = @"http://127.0.0.1/temfile/kingyi_v1.1.0/updatePhoto/pic.php";
    //    NSDictionary *parame = @{@"username":@"Syl"};
    
    [manager POST:host parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSString *strName = [[NSBundle mainBundle] pathForResource:@"4.jpg" ofType:nil];
        UIImage *img = [UIImage imageWithContentsOfFile:strName];
        NSData *data = UIImageJPEGRepresentation(img, 1);
        
        [formData appendPartWithFileData:data name:@"file" fileName:@"4.jpg" mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%zd - %zd",uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"xxx %@",error);
    }];
}

//下载文件
- (void)test2{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://121.42.204.103/4.jpg"]];
    
    NSURLSessionDownloadTask *down = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%zd - %zd",downloadProgress.completedUnitCount,downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSString *path = [cachesPath stringByAppendingPathComponent:response.suggestedFilename];
        
        NSLog(@"%@",path);
        
        return [NSURL fileURLWithPath:path];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"xxx %@",error);
    }];
    
    [down resume];
}

//get请求
- (void)test3{
    
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    [manger GET:@"http://japi.juhe.cn/joke/content/list.from?key=67fa66b67b2220cce169384e830d2902&page=2&pagesize=10&sort=asc&time=1418745237" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *a =[responseObject valueForKeyPath:@"result.wordInfo.words"];
        
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        
        if (a.count>0) {
            for (NSDictionary *dic in a) {
                [arr addObject:dic[@"tx_word"]];
            }
        }
        
        
        NSLog(@"---- %@",arr);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
    

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self test];
    
    
    
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
