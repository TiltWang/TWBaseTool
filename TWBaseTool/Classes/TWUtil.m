//
//  TWUtil.m
//  TWBaseTool
//
//  Created by Tilt on 2018/11/12.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import "TWUtil.h"

@implementation TWUtil

/// 是否含有刘海 即是否为X XS XS Max XR
+ (BOOL)isHasFringe {
    CGFloat iPhoneNotchDirectionSafeAreaInsets = 0;
    if (@available(iOS 11.0, *)) {
        UIEdgeInsets safeAreaInsets = [UIApplication sharedApplication].windows[0].safeAreaInsets;
        switch ([UIApplication sharedApplication].statusBarOrientation) {
            case UIInterfaceOrientationPortrait:{
                iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.top;
            }
                break;
            case UIInterfaceOrientationLandscapeLeft:{
                iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.left;
            }
                break;
            case UIInterfaceOrientationLandscapeRight:{
                iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.right;
            }
                break;
            case UIInterfaceOrientationPortraitUpsideDown:{
                iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.bottom;
            }
                break;
            default:
                iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.top;
                break;
        }
        return iPhoneNotchDirectionSafeAreaInsets > 20;
    } else {
        return NO;
    }
}

+ (CGFloat)getStatusBarHeight {
    return [TWUtil isHasFringe] ? 44.f : 20.f;
}
+ (CGFloat)getNavigationBarHeight {
    return [TWUtil isHasFringe] ? 88.f : 64.f;
}
+ (CGFloat)getTabBarHeight {
    return [TWUtil isHasFringe] ? (49.f + 34.f) : 49.f;
}
+ (CGFloat)getHomeIndicatorHeight {
    return [TWUtil isHasFringe] ? 34.f : 0.f;
}
@end
