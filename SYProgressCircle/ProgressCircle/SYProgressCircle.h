//
//  SYProgressCircle.h
//  SYProgressCircle
//
//  Created by shichenzhi on 2017/9/11.
//  Copyright © 2017年 shichenzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYProgressCircle : UIView

/**
 * 圆圈的半径,默认为（self的宽度/2-15.0）
 */
@property (nonatomic,assign) CGFloat circleRadius;

/**
 * 圆圈线条宽度，默认为15.0
 */
@property (nonatomic,assign) CGFloat backgroundCircleLineWidth;

/**
 * 背景圆的描边(线条)颜色（系统默认为无色，不是框架自带的）
 */
@property (nonatomic,strong) UIColor *lineStrokeColor;

/**
 * 圆内填充色，默认为黑色（系统默认为黑色，不是框架自带的）
 */
@property (nonatomic,strong) UIColor *fillColor;

/**
 * label文字显示
 */
@property (nonatomic,copy) NSString *precent;

/**
 * 动画执行时间，默认值为2秒
 */
@property (nonatomic,assign) CGFloat durationTime;

/**
 * 开始动画
 */
- (void)startAnimation;

@end
