//
//  TWUtil.h
//  TWBaseTool
//
//  Created by Tilt on 2018/11/12.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWUtil : NSObject
/// 是否含有刘海 即是否为X XS XS Max XR
+ (BOOL)isHasFringe;
///状态栏高度
+ (CGFloat)getStatusBarHeight;
///导航栏加状态栏高度
+ (CGFloat)getNavigationBarHeight;
///TabBar高度
+ (CGFloat)getTabBarHeight;
///底部home条的高度(刘海设备)
+ (CGFloat)getHomeIndicatorHeight;
@end
