//
//  SYProgressCircle.m
//  SYProgressCircle
//
//  Created by shichenzhi on 2017/9/11.
//  Copyright © 2017年 shichenzhi. All rights reserved.
//

#import "SYProgressCircle.h"

@interface SYProgressCircle ()
{
    CGFloat         radius;
    CGFloat         duration;
    CGFloat         lineWidth;
    UIBezierPath    *bezierPath;
}

@property (nonatomic,strong) CAShapeLayer *shapeLayer;

@property (nonatomic,strong) UILabel      *precentLable;

@end

@implementation SYProgressCircle

- (CAShapeLayer *)shapeLayer
{
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
    }
    return _shapeLayer;
}

- (UILabel *)precentLable
{
    if (!_precentLable) {
        _precentLable = [[UILabel alloc] init];
        _precentLable.font = [UIFont systemFontOfSize:20.0 weight:5.0];
        _precentLable.textColor = [UIColor orangeColor];
        _precentLable.textAlignment = NSTextAlignmentCenter;
        _precentLable.text = [NSString stringWithFormat:@"0%%"];
        _precentLable.backgroundColor = [UIColor clearColor];
    }
    return _precentLable;
}

#pragma mark - 构造方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        duration = 2.0;
        radius = 15.0;
        lineWidth = 15.0;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        duration = 2.0;
        radius = 15.0;
        lineWidth = 15.0;
    }
    return self;
}

#pragma mark - 重新布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    _shapeLayer.frame = self.bounds;
    _precentLable.frame = CGRectMake(0, 0, self.frame.size.width, 30);
    _precentLable.center = CGPointMake(self.center.x - self.frame.origin.x,self.center.y - self.frame.origin.y);
    
    //设置圆心，半径，起始角与结束角
    bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.center.x - self.frame.origin.x,self.center.y - self.frame.origin.y) radius:self.frame.size.width/2 - radius startAngle:-M_PI_2 endAngle:-M_PI_2+M_PI*2 clockwise:YES];
//    bezierPath = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    
    _shapeLayer.path = bezierPath.CGPath;
    _shapeLayer.lineWidth = lineWidth;
}

#pragma mark - 参数配置
- (void)setDurationTime:(CGFloat)durationTime
{
    _durationTime = durationTime;
    duration = durationTime;
}

- (void)setCircleRadius:(CGFloat)circleRadius
{
    _circleRadius = circleRadius;
    radius = circleRadius;
}

- (void)setBackgroundCircleLineWidth:(CGFloat)backgroundCircleLineWidth
{
    _backgroundCircleLineWidth = backgroundCircleLineWidth;
    lineWidth = backgroundCircleLineWidth;
}

- (void)setLineStrokeColor:(UIColor *)lineStrokeColor
{
    _lineStrokeColor = lineStrokeColor;
    _shapeLayer.strokeColor = lineStrokeColor.CGColor;
}

- (void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
    _shapeLayer.fillColor = fillColor.CGColor;
}

- (void)setPrecent:(NSString *)precent
{
    _precent = precent;
    _precentLable.text = [NSString stringWithFormat:@"%@%%",precent];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self.layer addSublayer:self.shapeLayer];
    [self addSubview:self.precentLable];
}

#pragma mark - 开始动画
- (void)startAnimation
{
    CGFloat precent = [_precent floatValue];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = duration;
    animation.fromValue = @(0);
    animation.toValue = @(precent/100);
    animation.speed = 2.0;
    
    _shapeLayer.strokeStart = 0;
    _shapeLayer.strokeEnd = precent/100;
    //这个Key可以随便填
    [_shapeLayer addAnimation:animation forKey:@"strokeEndAnimation"];
}

@end
