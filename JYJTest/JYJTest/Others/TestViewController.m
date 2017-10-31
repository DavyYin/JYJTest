//
//  TestViewController.m
//  jiaoyijieTest
//
//  Created by yanping on 2017/3/21.
//  Copyright © 2017年 YYP. All rights reserved.
//

#import "TestViewController.h"
#import "BBBViewController.h"
#import "LineView.h"

@interface TestViewController ()


@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"Test";
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(nextPage) forControlEvents:UIControlEventTouchUpInside];
    self.hideNavigationBar = YES;
    
    /* 绘图测试代码
    LineView *lineView = [[LineView alloc] initWithFrame:CGRectMake(50, 50, 200, 100)];
    [self.view addSubview:lineView];
    
    NSMutableArray *lineDataArray = [[NSMutableArray alloc] init];
    NSArray *priceArray = @[@201,@222,@123,@423,@345,@457,@223,@234,@344,@423,@1236,@123,@2432,@201,@222,@123,@423,@345,@457,@223,@234,@344,@423,@1236,@123,@2432,@201,@222,@292,@245];
    for (int i = 0; i < priceArray.count; i++) {
        LineDataModel *model = [[LineDataModel alloc] init];
        model.price = [(NSNumber *)[priceArray objectAtIndex:i] floatValue];
        [lineDataArray addObject:model];
    }
    lineView.lineDataArray = lineDataArray;
    lineView.bgColor = [UIColor clearColor];
//    lineView.lineColor = [self colorWithHexColorString:@"#7ad1fb"];
    lineView.lineColor = [UIColor colorWithRed:0/255 green:255/255 blue:0/255 alpha:1.0];
//    lineView.lineColor = [UIColor blueColor];
    lineView.columnNum = 30;
    
    [lineView drawLineView];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)nextPage {
//    TestViewController *vc = [[TestViewController alloc] init];
    BBBViewController *vc = [[BBBViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(UIColor *)colorWithHexColorString:(NSString *)hexColorString {
    if ([hexColorString length] <6){//长度不合法
        return [UIColor blackColor];
    }
    NSString *tempString=[hexColorString lowercaseString];
    if ([tempString hasPrefix:@"0x"]){//检查开头是0x
        tempString = [tempString substringFromIndex:2];
    }else if ([tempString hasPrefix:@"#"]) {//检查开头是#
        tempString = [tempString substringFromIndex:1];
    }
    if ([tempString length] !=6){
        return [UIColor blackColor];
    }
    
    //分解三种颜色的值
    NSRange range;
    range.location =0;
    range.length =2;
    NSString *rString = [tempString substringWithRange:range];
    range.location =2;
    NSString *gString = [tempString substringWithRange:range];
    range.location =4;
    NSString *bString = [tempString substringWithRange:range];
    //取三种颜色值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString]scanHexInt:&r];
    [[NSScanner scannerWithString:gString]scanHexInt:&g];
    [[NSScanner scannerWithString:bString]scanHexInt:&b];
    return [UIColor colorWithRed:((float) r /255.0f)
                           green:((float) g /255.0f)
                            blue:((float) b /255.0f)
                           alpha:1.0f];
}

@end
