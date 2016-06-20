//
//  AppDelegate.m
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/4.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "AppDelegate.h"
#import "Common.h"
#import "KKSplashController.h"
#import <SDWebImageManager.h>
#import <RESideMenu.h>
#import "KKHomeViewController.h"
#import "KKNavigationController.h"
#import "KKLeftSlideViewController.h"
#import "UIWindow+Extension.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:kScreenBounds];

    [self toHomeController];
    
    [self.window makeKeyAndVisible];
    
    [self.window showLanuchPageAndSetUmeng];
    
    return YES;
}

- (void)toHomeController{
    
    KKLeftSlideViewController *leftView = [[KKLeftSlideViewController alloc] init];
    
    KKHomeViewController *home = [[KKHomeViewController alloc] init];
    KKNavigationController *nav = [[KKNavigationController alloc] initWithRootViewController:home];
    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:nav leftMenuViewController:leftView  rightMenuViewController:nil];
    
    sideMenuViewController.menuPreferredStatusBarStyle = UIStatusBarStyleDefault;
    sideMenuViewController.contentViewShadowColor = [UIColor blackColor];
    sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuViewController.contentViewShadowOpacity = 0.0;
    sideMenuViewController.contentViewShadowRadius = 0;
    sideMenuViewController.contentViewShadowEnabled = YES;
    
    sideMenuViewController.contentViewScaleValue = 1.0f;
    sideMenuViewController.bouncesHorizontally = NO;
    
    sideMenuViewController.contentViewInPortraitOffsetCenterX = 0;
    
    self.window.rootViewController = sideMenuViewController;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    
    [[SDWebImageManager sharedManager] cancelAll];
    
    [[SDWebImageManager sharedManager].imageCache clearMemory];
    
}

- (void)applicationWillResignActive:(UIApplication *)application{
    
    [[SDWebImageManager sharedManager] cancelAll];
    
    [[SDWebImageManager sharedManager].imageCache clearMemory];
}


@end
