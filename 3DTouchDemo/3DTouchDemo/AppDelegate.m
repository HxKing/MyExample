
#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 点击某一个item时调用
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{

    // 获取UITabBarController
    UITabBarController *tabVc = (UITabBarController *)self.window.rootViewController;
    
    // 根据shortcutItem.type 判断点击了哪一个item
    if ([shortcutItem.type isEqualToString:@"type1"]) {
        // 切换控制器
        tabVc.selectedIndex = 0;
    }else if ([shortcutItem.type isEqualToString:@"type2"]){
        tabVc.selectedIndex = 1;
    }
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    // Override point for customization after application launch.
    // 只有标题的item
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"type1" localizedTitle:@"标题1"];
    // 有标题，有副标题的item
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"type2" localizedTitle:@"标题2" localizedSubtitle:@"副标题" icon:nil userInfo:nil];

    // 获取icon对象
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeHome];
    // 有标题，有副标题，有图片（系统）的item
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc] initWithType:@"type3" localizedTitle:@"标题3" localizedSubtitle:@"系统图标" icon:icon userInfo:nil];

    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"feiji"];
    // 有标题，有副标题，有图片（自定义）的item
    UIApplicationShortcutItem *item4 = [[UIApplicationShortcutItem alloc] initWithType:@"type4" localizedTitle:@"标题4" localizedSubtitle:@"自定义icon" icon:icon2 userInfo:nil];
    // 添加到icon快捷方式
    [UIApplication sharedApplication].shortcutItems = @[item1,item2,item3,item4];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
