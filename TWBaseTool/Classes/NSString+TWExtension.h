//
//  NSString+TWExtension.h
//  TWBaseTool
//
//  Created by Tilt on 2018/12/11.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (TWExtension)

//检查对象是否为空null 或者长度为0
+ (NSString *)checkValue:(id)value;

#pragma mark - 求字符串的size
//求字符串的高度
- (CGFloat)getStringHeightWithFont:(UIFont *)font textMaxWidth:(CGFloat)maxWidth;
//求字符串的宽度
- (CGFloat)getStringWidthWithFont:(UIFont *)font textMaxHeight:(CGFloat)maxHeight;

- (BOOL)checkStringIsNumber;

@end
