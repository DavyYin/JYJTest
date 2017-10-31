//
//  TopNavViewController.m
//  jiaoyijieTest
//
//  Created by ping on 2017/3/12.
//  Copyright © 2017年 YYP. All rights reserved.
//

#import "TopNavViewController.h"
#import "BaseViewController.h"

@interface TopNavViewController ()

@end

@implementation TopNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationBarHidden = YES;//隐藏导航栏，使用自定义导航栏
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

//View controller-based status bar appearance 为 YES 时， 用于设置状态栏
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 44)];
        [backBtn setImage:[UIImage imageNamed:@"day_arrow_left"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * backBtnItem= [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -5;
        if ([viewController isKindOfClass:[BaseViewController class]]) {
            BaseViewController *baseVC = (BaseViewController *)viewController;
            baseVC.navItem.leftBarButtonItems = @[negativeSpacer,backBtnItem];
        }else {
            viewController.navigationItem.leftBarButtonItems = @[negativeSpacer,backBtnItem];
        }
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
}

- (void)popViewController {
    [self popViewControllerAnimated:YES];
}

@end
