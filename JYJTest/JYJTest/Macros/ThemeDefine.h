//
//  ThemeDefine.h
//  jiaoyijieTest
//
//  Created by yanping on 2017/3/21.
//  Copyright © 2017年 YYP. All rights reserved.
//

#ifndef ThemeDefine_h
#define ThemeDefine_h

#define KDeviceWidth MIN([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)
#define KDeviceHeight MAX([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)

// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (iPhoneX ? (49.f+34.f) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)

//导航栏字号
#define NavTitleFontSize 18


#endif /* ThemeDefine_h */
