//
//  AppDelegate.m
//  jiaoyijieTest
//
//  Created by ping on 2017/3/12.
//  Copyright © 2017年 YYP. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePageViewController.h"
#import "MainTabBarViewController.h"
#import "ToolMethods.h"
#import "TopNavViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [NSThread sleepForTimeInterval:3];
    
//    HomePageViewController *homePageVC = [[HomePageViewController alloc] init];
    MainTabBarViewController *mainTabVC = [[MainTabBarViewController alloc] init];
//    TopNavViewController *topNav = [[TopNavViewController alloc] initWithRootViewController:mainTabVC];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    [self.window setRootViewController:mainTabVC];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"day_navigationbar_bg"] forBarMetrics:UIBarMetricsDefault];//设置导航栏背景图片
    [[UINavigationBar appearance] setTranslucent:NO];//设置导航栏 半透明度开关
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
