//
//  MainTabBarViewController.m
//  jiaoyijieTest
//
//  Created by ping on 2017/3/12.
//  Copyright © 2017年 YYP. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "HomePageViewController.h"
#import "TestViewController.h"
#import "TopNavViewController.h"
#import "ToolMethods.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViewControllers {
    HomePageViewController *firstVC = [[HomePageViewController alloc] init];
    TopNavViewController *topNav1 = [[TopNavViewController alloc] initWithRootViewController:firstVC];
    firstVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"tabbar_icon_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_icon_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    TestViewController *SecondVC = [[TestViewController alloc] init];
    TopNavViewController *topNav2 = [[TopNavViewController alloc] initWithRootViewController:SecondVC];
    SecondVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"行情" image:[[UIImage imageNamed:@"tabbar_icon_markets_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_icon_markets_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];//UIImageRenderingModeAlwaysOriginal   // 始终绘制图片原始状态，不使用Tint Color。
    
    
    TestViewController *ThirdVC = [[TestViewController alloc] init];
    TopNavViewController *topNav3 = [[TopNavViewController alloc] initWithRootViewController:ThirdVC];
    ThirdVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"智投" image:[[UIImage imageNamed:@"tabbar_icon_ea_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_icon_ea_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    TestViewController *VC4 = [[TestViewController alloc] init];
    TopNavViewController *topNav4 = [[TopNavViewController alloc] initWithRootViewController:VC4];
    VC4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"交易" image:[[UIImage imageNamed:@"tabbar_icon_trade_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_icon_trade_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    TestViewController *VC5 = [[TestViewController alloc] init];
    TopNavViewController *topNav5 = [[TopNavViewController alloc] initWithRootViewController:VC5];
    VC5.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"tabbar_icon_me_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_icon_me_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    self.viewControllers = [NSArray arrayWithObjects:topNav1,topNav2,topNav3,topNav4,topNav5,nil];
    
    [self setupTabBarAppearance];
}

- (void)setupTabBarAppearance {
    //设置TabBar颜色
    [UITabBar appearance].translucent = YES;
    [UITabBar appearance].tintColor = [UIColor orangeColor]; //图片选中渲染颜色
    [UITabBar appearance].barTintColor = [UIColor whiteColor]; //tabBar背景颜色
    [UITabBar appearance].selectionIndicatorImage = [ToolMethods imageFromColor:[UIColor lightGrayColor] forSize:CGSizeMake(375/5, TAB_BAR_HEIGHT) withCornerRadius:0];//选中item背景色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:11] ,NSFontAttributeName,[UIColor blackColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
}

@end
