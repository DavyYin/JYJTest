//
//  HomePageViewController.m
//  jiaoyijieTest
//
//  Created by ping on 2017/3/12.
//  Copyright © 2017年 YYP. All rights reserved.
//

#import "HomePageViewController.h"
#import "TestViewController.h"
#import "BBBViewController.h"
#import "LinkTextView.h"

@interface HomePageViewController ()<UITextViewDelegate>

// 显示控件
@property (weak, nonatomic) IBOutlet UILabel *weiboLabel;
@property (weak, nonatomic) IBOutlet LinkTextView *attributedTextView;

- (IBAction)btnClick:(id)sender;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"首页";
    self.view.backgroundColor = [UIColor greenColor];
    
    [super viewDidLoad];
    NSString *weibo = @"@用户A:哈哈哈哈哈哈哈哈[doge] #话题话题# //@Tom: @用户B 微博内容微博内容[doge]微博内容微博内容https://www.weibo.com";
    [self.attributedTextView setContent:weibo];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.attributedTextView.editable = NO;
    self.attributedTextView.delegate = self;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)btnClick:(id)sender {
    TestViewController *vc = [[TestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
