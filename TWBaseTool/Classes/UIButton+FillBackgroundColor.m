//
//  UIButton+FillBackgroundColor.m
//  TWBaseTool
//
//  Created by Tilt on 2018/12/11.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import "UIButton+FillBackgroundColor.h"
#import "UIImage+TWExtension.h"

@implementation UIButton (FillBackgroundColor)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIImage imageWithColor:backgroundColor] forState:state];
}

@end
