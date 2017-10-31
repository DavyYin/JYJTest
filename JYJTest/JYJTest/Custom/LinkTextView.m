//
//  JYJChatTextView.m
//  jiaoyijieTest
//
//  Created by ping on 2017/10/7.
//  Copyright © 2017年 YYP. All rights reserved.
//

#import "LinkTextView.h"
#import "ThemeDefine.h"
//#import "WGOpenURLViewController.h"

#define URLRegulaStr @"(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(https?)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]"
//#define URLRegulaStr @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"

@interface LinkTextView() {
    NSMutableArray *_URLDataArray;
    NSDictionary *_selectedURLDic;
}
@end

@implementation LinkTextView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
//    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.selectable = NO;
    self.editable = NO;
    self.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.textContainer.lineBreakMode = NSLineBreakByCharWrapping;
    
    UILongPressGestureRecognizer *touch = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:touch];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOnTextView:)];
    [self addGestureRecognizer:tap];
    
    _URLDataArray = [[NSMutableArray alloc] init];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if ([NSStringFromSelector(action) isEqualToString:@"copyTextSender1:"]) {
        return YES;
    }
    if ([NSStringFromSelector(action) isEqualToString:@"copyTextSender2:"]) {
        return YES;
    }
    return NO;
}


- (void)longPress:(UIGestureRecognizer*) recognizer {
    
    NSDictionary *urlDataDic = [self getUrlDataTapOn:recognizer];
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    UIMenuItem *copyTextItem1 = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyTextSender1:)];
    UIMenuItem *copyTextItem2 = [[UIMenuItem alloc] initWithTitle:@"复制链接" action:@selector(copyTextSender2:)];
    if (urlDataDic) {
        [menu setTargetRect:self.frame inView:self.superview];
        [menu setArrowDirection:UIMenuControllerArrowDefault];
        [menu setMenuItems:@[copyTextItem2]];
    }else {
        [menu setTargetRect:self.frame inView:self.superview];
        [menu setArrowDirection:UIMenuControllerArrowDefault];
        [menu setMenuItems:@[copyTextItem1]];
    }
    if (menu.isMenuVisible && _selectedURLDic == urlDataDic) {
        return;
    }else {
        _selectedURLDic = urlDataDic;
        [menu setMenuVisible:NO animated:NO];//处理ios9下，切换MenuItem时的闪烁
        [menu performSelector:@selector(setMenuVisible:) withObject:@YES afterDelay:0.1];
    }
    
}

- (void)tapOnTextView:(UIGestureRecognizer*) recognizer {
    NSDictionary *urlDataDic = [self getUrlDataTapOn:recognizer];
    if (urlDataDic) {
        NSString *urlStr = [urlDataDic objectForKey:@"urlString"];
        NSLog(@"%@",urlStr);
        if (self.tapDelegate && [self.tapDelegate respondsToSelector:@selector(JYJChatTextView:tapOnURL:)]) {
            [self.tapDelegate JYJChatTextView:self tapOnURL:urlStr];
        }
    }
}


- (void)setContent:(NSString *)contentText {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:URLRegulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    NSArray *arrayOfAllMatches = [regex matchesInString:contentText options:0 range:NSMakeRange(0, [contentText length])];
    UIFont *font = [UIFont systemFontOfSize:14];
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:contentText attributes:@{NSFontAttributeName: font}];
    for (NSTextCheckingResult *match in arrayOfAllMatches){
        NSString* subString = [contentText substringWithRange:match.range];
        [attributedText addAttribute:NSLinkAttributeName value:[NSURL URLWithString:subString] range:match.range];
    }
    self.attributedText = attributedText;
    
    [self handleLinkData];
}

- (CGFloat)calculateTextViewHeight {
    CGSize sizeToFit = [self sizeThatFits:CGSizeMake(KDeviceWidth-130, MAXFLOAT)];
    return sizeToFit.height;
}

- (void)handleLinkData {
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:URLRegulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    NSString *contentString;
    if (self.attributedText) {
        contentString = self.attributedText.string;
    }else {
        contentString = self.text;
    }
    [_URLDataArray removeAllObjects];
    [regex enumerateMatchesInString:contentString
                               options:kNilOptions
                                 range:NSMakeRange(0, contentString.length)
                            usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                                //NSTextCheckingResult有很多属性，和检测的类型相匹配，如URL，phoneNumber，date，addressComponents等等
                                //NSTextCheckingResult还有Range 和 NSTextCheckingType两个属性，方便进行操作
                                NSLog(@"result.range = %@",NSStringFromRange(result.range));
                                    NSString *urlString = [self.attributedText attributedSubstringFromRange:result.range].string;
                                    NSLog(@"url = %@",result.URL);
                                    NSDictionary *dateDic =@{
                                                             @"location":[NSNumber numberWithInteger:result.range.location],
                                                             @"length":[NSNumber numberWithInteger:result.range.length],
                                                             @"urlString":urlString,
                                                             };
                                    [_URLDataArray addObject:dateDic];
                                if (result.URL) {
                                }
                            }];
}

- (NSDictionary *)getUrlDataTapOn:(UIGestureRecognizer *)recognizer {
    CGPoint tapLocation = [recognizer locationInView:self];
    NSLog(@"Tap Gesture Coordinates: %.2f %.2f", tapLocation.x, tapLocation.y);
    tapLocation.y += self.contentOffset.y;
    //get location in text from textposition at point
    self.selectable = YES;//处理ios9下，返回tapPosition 为nil的情况
    UITextPosition *tapPosition = [self closestPositionToPoint:tapLocation];
    self.selectable = NO;
    //fetch the word at this position (or nil, if not available)
    UITextRange *textRange = [self.tokenizer rangeEnclosingPosition:tapPosition withGranularity:UITextGranularityWord inDirection:UITextLayoutDirectionRight];
    NSInteger location = [self offsetFromPosition:self.beginningOfDocument toPosition:textRange.start];
    NSInteger length = [self offsetFromPosition:textRange.start toPosition:textRange.end];
    
    NSLog(@"loction: %ld, length: %ld",location,length);
    
    for (int i = 0; i < _URLDataArray.count; i++) {
        NSDictionary *urlDataDic = [_URLDataArray objectAtIndex:i];
        NSInteger urlLocation = [(NSNumber *)[urlDataDic objectForKey:@"location"] integerValue];
        NSInteger urlLength = [(NSNumber *)[urlDataDic objectForKey:@"length"] integerValue];
        NSLog(@"urlLocation: %ld, urlLength: %ld",urlLocation,urlLength);
        if (location >= urlLocation && location+length <= urlLocation+urlLength) {
            return urlDataDic;
        }
    }
    return nil;
}

-(void)copyTextSender1:(id)sender {
    NSString *contentString;
    if (self.attributedText) {
        contentString = self.attributedText.string;
    }else {
        contentString = self.text;
    }
    UIPasteboard *pasteboard=[UIPasteboard generalPasteboard];
    pasteboard.string = contentString;
}
-(void)copyTextSender2:(id)sender {
    NSString *urlStr = [_selectedURLDic objectForKey:@"urlString"];
    UIPasteboard *pasteboard=[UIPasteboard generalPasteboard];
    pasteboard.string = urlStr;
}
@end
