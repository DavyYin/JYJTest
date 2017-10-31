//
//  BaseViewController.h
//  jiaoyijieTest
//
//  Created by ping on 2017/3/12.
//  Copyright © 2017年 YYP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeDefine.h"

@interface BaseViewController : UIViewController

//设置标题
@property (nonatomic, assign) NSString *navTitle;

@property (nonatomic, strong) UINavigationBar *navBar;

@property (nonatomic, strong) UINavigationItem *navItem;

@property(nonatomic,assign) BOOL hideNavigationBar;
//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color;


@end
