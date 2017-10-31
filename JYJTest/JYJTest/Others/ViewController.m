//
//  ViewController.m
//  jiaoyijieTest
//
//  Created by ping on 2017/3/12.
//  Copyright © 2017年 YYP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 1001, 100, 100)];
    label.text = NSStringFromClass(self.class);
    label.textColor = [UIColor redColor];
    [label sizeToFit];
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
