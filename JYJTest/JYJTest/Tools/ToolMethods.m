//
//  ToolMethods.m
//  jiaoyijieTest
//
//  Created by yanping on 2017/3/20.
//  Copyright © 2017年 YYP. All rights reserved.
//

#import "ToolMethods.h"

@implementation ToolMethods


//创建纯色图片 设置颜色
+ (UIImage *)imageFromColor:(UIColor *)color {
    UIImage *image = [self imageFromColor:color forSize:CGSizeMake(100, 100) withCornerRadius:1];
    return image;
}

//创建纯色图片 设置颜色、大小、圆角
+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContext(size);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    // Draw your image
    [image drawInRect:rect];
    
    // Get the image, here setting the UIImageView image
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return image;
}


@end
