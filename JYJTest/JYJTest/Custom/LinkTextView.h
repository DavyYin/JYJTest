//
//  JYJChatTextView.h
//  jiaoyijieTest
//
//  Created by ping on 2017/10/7.
//  Copyright © 2017年 YYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LinkTextView;

@protocol JYJChatTextViewDelegate <NSObject>

- (void)JYJChatTextView:(LinkTextView *)textView tapOnURL:(NSString *)urlString;

@end

@interface LinkTextView : UITextView

@property (nonatomic, assign) id <JYJChatTextViewDelegate> tapDelegate;

- (void)setContent:(NSString *)contentText;

- (CGFloat)calculateTextViewHeight;

@end
