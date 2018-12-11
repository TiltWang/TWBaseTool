//
//  UIImage+TWExtension.h
//  TWBaseTool
//
//  Created by Tilt on 2018/12/11.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TWExtension)
//根据颜色返回图片
+ (UIImage *)imageWithColor:(UIColor *)color;

//获取网络图片
+ (UIImage *)imageWithUrlString:(NSString *)urlString;

//绘制图片圆角
- (UIImage *)drawCornerInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius;
@end
