//
//  BBBViewController.m
//  jiaoyijieTest
//
//  Created by yanping on 2017/3/24.
//  Copyright © 2017年 YYP. All rights reserved.
//

#import "BBBViewController.h"
#import "AAAViewController.h"
#import "TestViewController.h"

@interface BBBViewController ()

@end

@implementation BBBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.navTitle = @"BBB";
    // Do any additional setup after loading the view.
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(nextPage) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)nextPage {
    AAAViewController *vc = [[AAAViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    [self.navigationController presentViewController:vc animated:YES completion:^{
    }];
}

@end
