//
//  UIWindow+Extension.m
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/4.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "KKSplashController.h"


@implementation UIWindow (Extension)

- (void)showLanuchPageAndSetUmeng{
    
    KKSplashController *splash = [[KKSplashController alloc] init];
    
    [self addSubview:splash.view];
}

@end
