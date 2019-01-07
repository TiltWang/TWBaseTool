//
//  TWLoadingView.h
//  TWBaseTool
//
//  Created by Tilt on 2019/1/7.
//  Copyright © 2019年 tilt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWLoadingView : UIView

/**
 类方法创建等待视图

 @param frame frame
 @param circleBgColor 圆环背景色 默认为clearColor
 @param circleColor 圆环主色调
 @param circleWidth 圆环占用的宽度
 @param circleBorderWidth 圆环的环的宽度
 @param tipText 提示文本
 @param tipFont 提示文本字体
 @param tipColor 提示文本的颜色
 @return 返回生成的等待视图 动画已开启
 */
+ (instancetype)loadingViewWithFrame:(CGRect)frame circleBgColor:(UIColor *)circleBgColor circleColor:(UIColor *)circleColor circleWidth:(CGFloat)circleWidth circleBorderWidth:(CGFloat)circleBorderWidth withTipText:(NSString *)tipText tipFont:(UIFont *)tipFont tipColor:(UIColor *)tipColor;

/**
 类方法创建默认等待视图

 @param frame frame
 @return 返回生成的等待视图 动画已开启
 */
+ (instancetype)loadingViewDefaultWithFrame:(CGRect)frame;

@end
