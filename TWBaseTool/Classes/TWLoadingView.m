//
//  TWLoadingView.m
//  TWBaseTool
//
//  Created by Tilt on 2019/1/7.
//  Copyright © 2019年 tilt. All rights reserved.
//

#import "TWLoadingView.h"
#import "TWBaseTool.h"
#import "UIView+Frame.h"

@interface TWLoadingView ()

@property (nonatomic, strong) UIView *circleBgView;

@property (nonatomic, strong) UIView *circleView;

@property (nonatomic, assign) CGFloat circleWidth;

@property (nonatomic, strong) UIColor *circleColor;

@property (nonatomic, assign) CGFloat circleBorderWidth;

@property (nonatomic, strong) UILabel *tipLbl;

@end

@implementation TWLoadingView

+ (instancetype)loadingViewDefaultWithFrame:(CGRect)frame {
    TWLoadingView *loadingView = [[TWLoadingView alloc] initWithFrame:frame];
    [loadingView setupUI];
    return loadingView;
}

+ (instancetype)loadingViewWithFrame:(CGRect)frame circleBgColor:(UIColor *)circleBgColor circleColor:(UIColor *)circleColor circleSideColor:(UIColor *)circleSideColor circleWidth:(CGFloat)circleWidth circleBorderWidth:(CGFloat)circleBorderWidth withTipText:(NSString *)tipText tipFont:(UIFont *)tipFont tipColor:(UIColor *)tipColor {
    TWLoadingView *loadingView = [[TWLoadingView alloc] initWithFrame:frame];
    if (circleColor) {
        loadingView.circleColor = circleColor;
    }
    if (circleSideColor) {
        loadingView.backgroundColor = circleSideColor;
    }
    if (circleWidth > 0.1) {
        loadingView.circleWidth = circleWidth;
    }
    if (circleBorderWidth > 0.01) {
        loadingView.circleBorderWidth = circleBorderWidth;
    }
    if (circleBgColor) {
        loadingView.circleBgView.backgroundColor = circleBgColor;
    }
    if (tipText) {
        loadingView.tipLbl.text = tipText;
    } else {
        loadingView.tipLbl.text = @"";
    }
    if (tipFont) {
        loadingView.tipLbl.font = tipFont;
    }
    if (tipColor) {
        loadingView.tipLbl.textColor = tipColor;
    }
    [loadingView setupUI];
    return loadingView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.circleBgView];
    [self addSubview:self.circleView];
    [self addSubview:self.tipLbl];
    
//    self.circleBgView.center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
//    self.circleView.center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
    
    self.tipLbl.width = self.frame.size.width - 20.0;
    [self.tipLbl sizeToFit];
//    self.tipLbl.y = CGRectGetMaxY(self.circleView.frame) + 5;
//    self.tipLbl.centerX = self.frame.size.width / 2.0;
    
    [self buildCricleLayer];
    [self anim];
}

- (void)layoutSubviews {
    self.circleBgView.center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
    self.circleView.center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
    self.tipLbl.y = CGRectGetMaxY(self.circleView.frame) + 5;
    self.tipLbl.centerX = self.frame.size.width / 2.0;
}


- (void)anim {
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"]; ;
    // 设定动画选项
    animation.duration = 1;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = HUGE_VALF;
    // 设定旋转角度
    animation.fromValue = [NSNumber numberWithFloat:0.0]; // 起始角度
    animation.toValue = [NSNumber numberWithFloat:2 * M_PI]; // 终止角度
    [_circleView.layer addAnimation:animation forKey:@"rotate-layer"];
}



- (void)buildCricleLayer {
    ///创建渐变图层
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor, (__bridge id)self.circleColor.CGColor];
    gradientLayer.locations = @[@0.2, @0.6];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame =CGRectMake(0, 0, self.circleWidth, self.circleWidth);
    [self.circleView.layer insertSublayer:gradientLayer atIndex:0];
    
    ///添加mask
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathAddRelativeArc(pathRef, nil, self.circleWidth / 2.0, self.circleWidth / 2.0, self.circleWidth / 2.0 - 5, 0, 2 * M_PI);
    layer.path = pathRef;
    layer.lineWidth = self.circleBorderWidth;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = self.circleColor.CGColor;
    CGPathRelease(pathRef);
    self.circleView.layer.mask = layer;
}

- (UIView *)circleBgView {
    if (!_circleBgView) {
        _circleBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.circleWidth, self.circleWidth)];
        _circleBgView.layer.cornerRadius = 3.0;
        _circleBgView.layer.masksToBounds = YES;
    }
    return _circleBgView;
}

- (UIView *)circleView {
    if (!_circleView) {
        _circleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.circleWidth, self.circleWidth)];
    }
    return _circleView;
}

- (CGFloat)circleWidth {
    if (_circleWidth <= 1.0) {
       _circleWidth = 40.0;
    }
    return _circleWidth;
}

- (UIColor *)circleColor {
    if (!_circleColor) {
        _circleColor = [UIColor blueColor];
    }
    return _circleColor;
}
- (CGFloat)circleBorderWidth {
    if (_circleBorderWidth <= 0.1) {
        _circleBorderWidth = 3.0;
    }
    return _circleBorderWidth;
}

- (UILabel *)tipLbl {
    if (!_tipLbl) {
        _tipLbl = [[UILabel alloc] init];
        _tipLbl.font = [UIFont systemFontOfSize:12.0];
        _tipLbl.textColor = HEXCOLOR(0x666666);
        _tipLbl.text = @"加载中...";
        _tipLbl.numberOfLines = 0;
        _tipLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _tipLbl;
}

@end
