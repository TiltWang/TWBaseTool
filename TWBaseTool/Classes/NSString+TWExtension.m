//
//  NSString+TWExtension.m
//  TWBaseTool
//
//  Created by Tilt on 2018/12/11.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import "NSString+TWExtension.h"

@implementation NSString (TWExtension)
//检查对象是否为空null 或者长度为0
+ (NSString *)checkValue:(id)value {
    NSString *str;
    if (value == [NSNull null]) {
        str = @"";
    } else {
        str = value;
    }
    if ([value isMemberOfClass:[NSNumber class]]) {
        str = @"";
    }
    if (str.length == 0) {
        str = @"";
    }
    return str;
}

#pragma mark - 求字符串的size
//求字符串的高度
- (CGFloat)getStringHeightWithFont:(UIFont *)font textMaxWidth:(CGFloat)maxWidth {
    CGSize maxSize = CGSizeMake(maxWidth, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.height;
}
//求字符串的宽度
- (CGFloat)getStringWidthWithFont:(UIFont *)font textMaxHeight:(CGFloat)maxHeight {
    CGSize maxSize = CGSizeMake(MAXFLOAT, maxHeight);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.width;
}

- (BOOL)checkStringIsNumber {
    if (self.length == 0) {
        return NO;
    }
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}
@end
