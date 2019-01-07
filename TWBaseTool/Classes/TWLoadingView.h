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
 @param circleColor 圆环主色调
 @param circleWith 圆环占用的宽度
 @param circleBorderWidth 圆环的环的宽度
 @param tipText 提示文本
 @param tipFont 提示文本字体
 @param tipColor 提示文本的颜色
 @return 返回生成的等待视图 动画已开启
 */
+ (instancetype)loadingViewWithFrame:(CGRect)frame circleColor:(UIColor *)circleColor circleWidth:(CGFloat)circleWith circleBorderWidth:(CGFloat)circleBorderWidth withTipText:(NSString *)tipText tipFont:(UIFont *)tipFont tipColor:(UIColor *)tipColor;

/**
 类方法创建默认等待视图

 @param frame frame
 @return 返回生成的等待视图 动画已开启
 */
+ (instancetype)loadingViewDefaultWithFrame:(CGRect)frame;

@end
