//
//  BaseViewController.m
//  jiaoyijieTest
//
//  Created by ping on 2017/3/12.
//  Copyright © 2017年 YYP. All rights reserved.
//

#import "BaseViewController.h"
#import "ThemeDefine.h"
#import "ToolMethods.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navBar = [[UINavigationBar alloc] init];
        self.navItem = [[UINavigationItem alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //使用自定义导航栏
//    [self setupCustomNavigationBar];
    
//    [self setStatusBarBackgroundColor:[UIColor blackColor]];
    
    
    //全屏侧滑
    //1.获取系统interactivePopGestureRecognizer对象的target对象
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    //2.创建滑动手势，taregt设置interactivePopGestureRecognizer的target，所以当界面滑动的时候就会自动调用target的action方法。
    //handleNavigationTransition是私有类_UINavigationInteractiveTransition的方法，系统主要在这个方法里面实现动画的。
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    [pan addTarget:target action:NSSelectorFromString(@"handleNavigationTransition:")];
    //3.设置代理
    pan.delegate = self;
    //4.添加到导航控制器的视图上
    [self.navigationController.view addGestureRecognizer:pan];
    //5.禁用系统的滑动手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:self.hideNavigationBar  animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavTitle:(NSString *)navTitle {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = navTitle;
    titleLabel.font = [UIFont systemFontOfSize:NavTitleFontSize];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
//    self.navItem.titleView = titleLabel;
//    self.titleView = titleLabel;
    
}

//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

- (void)setupCustomNavigationBar {
    self.navBar.frame = CGRectMake(0, 20, KDeviceWidth, 44);
    [self.navBar setBackgroundImage:[ToolMethods imageFromColor:[UIColor blackColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navBar setTranslucent:NO];
    self.navBar.barTintColor = [UIColor blackColor];
    [self.view addSubview:self.navBar];
    
    self.navBar.items = @[self.navItem];
}

#pragma mark - 滑动开始会触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //只有导航的根控制器不需要右滑的返回的功能。
    if (self.navigationController.viewControllers.count <= 1)
    {
        return NO;
    }
    
    return YES;
}

@end
