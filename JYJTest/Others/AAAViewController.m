//
//  AAAViewController.m
//  jiaoyijieTest
//
//  Created by yanping on 2017/3/24.
//  Copyright © 2017年 YYP. All rights reserved.
//

#import "AAAViewController.h"

@interface AAAViewController ()

@end

@implementation AAAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"AAA";
    self.view.backgroundColor = [UIColor redColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(nextPage) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)nextPage {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

@end
