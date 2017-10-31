//
//  ToolMethods.h
//  jiaoyijieTest
//
//  Created by yanping on 2017/3/20.
//  Copyright © 2017年 YYP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ToolMethods : NSObject

///创建纯色图片 设置颜色
+ (UIImage *)imageFromColor:(UIColor *)color;

//创建纯色图片 设置颜色、大小、圆角
+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius;


@end
