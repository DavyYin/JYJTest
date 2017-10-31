//
//  JYJLineView.m
//  YubeiTD
//
//  Created by yanping on 2017/9/20.
//  Copyright © 2017年 Jiaoyijie. All rights reserved.
//

#define KMarginGap 5
#define KLineGap 5

#import "LineView.h"
#import "LinePositionModel.h"

@interface LineView() {
    NSMutableArray<LinePositionModel *> *_positionDataArray;//位置数据数组
    CGFloat _viewWidth;
    CGFloat _viewHeight;
}

@end

@implementation LineView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _viewWidth = frame.size.width;
        _viewHeight = frame.size.height;
        _positionDataArray = [[NSMutableArray alloc] init];
        
        _lineWidth = 2;
        _lineColor = [UIColor redColor];
        _bgColor = [UIColor clearColor];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

//画线数据赋值
- (void)handleLineData {
    if (self.lineDataArray.count > 0) {
        LineDataModel *firstLineData = [self.lineDataArray objectAtIndex:0];
        
        __block CGFloat maxValue = firstLineData.price;
        __block CGFloat minValue = firstLineData.price;
        
        [self.lineDataArray enumerateObjectsUsingBlock:^(LineDataModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.price > maxValue) {
                maxValue = obj.price;
            }
            if (obj.price < minValue) {
                minValue = obj.price;
            }
        }];
        
        CGFloat unitValueY = (maxValue-minValue)/(_viewHeight-KMarginGap*2);
        
        CGFloat unitValueX = KLineGap;
        if (self.columnNum != 0) {
            if (self.lineDataArray.count > self.columnNum) {
                self.columnNum = self.lineDataArray.count;
            }
            unitValueX = (_viewWidth-2*KMarginGap)/(self.columnNum-1);
        }else {
            if (KLineGap*self.lineDataArray.count > _viewWidth-KMarginGap*2) {
                unitValueX = (_viewWidth-2*KMarginGap)/(self.lineDataArray.count-1);
            }else {
                unitValueX = KLineGap;
            }
        }
        if (unitValueX < 1) {
            unitValueX = 1;
        }
        
        [self.lineDataArray enumerateObjectsUsingBlock:^(LineDataModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            LinePositionModel *positionModel = [[LinePositionModel alloc] init];
            CGFloat x = KMarginGap+(unitValueX*idx);
            CGFloat y = _viewHeight-KMarginGap - (obj.price-minValue)/unitValueY;
            CGPoint point = CGPointMake(x, y);
            positionModel.point = point;
            [_positionDataArray addObject:positionModel];
        }];
        
    }
}

- (void)drawLineView {
    [self handleLineData];
    [self setNeedsDisplay];
}

//画线
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    CGContextSetFillColorWithColor(context, _bgColor.CGColor);
    CGContextFillRect(context, self.bounds);
    CGContextSetStrokeColorWithColor(context, _lineColor.CGColor);
    CGContextSetLineWidth(context, _lineWidth);
    CGPoint firstPoint = _positionDataArray.firstObject.point;
    CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
    for (int i = 0; i < _positionDataArray.count; i++) {
        CGPoint point = _positionDataArray[i].point;
        CGContextAddLineToPoint(context, point.x, point.y);
    }
    CGContextStrokePath(context);
}

@end
