//
//  AppDelegate.m
//  WKKit
//
//  Created by 王宇 on 16/9/13.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "AppDelegate.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self createTabbar];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

#pragma mark 创建tabbar
-(void)createTabbar{
    //创建window
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    if (!self.tabbar) {
        self.tabbar = [[WKTabbarController alloc] init];
        self.tabbar.delegate = (id)self;
    }
    
    [self.window setRootViewController:self.tabbar];
    
    [self.window makeKeyAndVisible];

}
//#pragma mark - 键盘管理对象
//- (void)configureKeyboardManager{
//    IQKeyboardManager.sharedManager.enableAutoToolbar = NO;
//    IQKeyboardManager.sharedManager.shouldResignOnTouchOutside = YES;
//}

@end
