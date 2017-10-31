//
//  JYJLineView.h
//  YubeiTD
//
//  Created by yanping on 2017/9/20.
//  Copyright © 2017年 Jiaoyijie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineDataModel.h"

@interface LineView : UIView

@property (nonatomic, strong) UIColor *lineColor;//画线颜色
@property (nonatomic, assign) CGFloat lineWidth;//画线宽度
@property (nonatomic, strong) UIColor *bgColor;//背景颜色

@property (nonatomic, assign) NSInteger columnNum;//列数(即份数：包含数据点数)
@property (nonatomic, strong) NSArray<LineDataModel *> *lineDataArray;//位置数据数组

- (instancetype)initWithFrame:(CGRect)frame;

//外部调用绘制方法
- (void)drawLineView;

@end
