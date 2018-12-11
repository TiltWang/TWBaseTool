//
//  NSAttributedString+TWExtension.m
//  TWBaseTool
//
//  Created by Tilt on 2018/12/11.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import "NSAttributedString+TWExtension.h"

@implementation NSAttributedString (TWExtension)

- (CGFloat)getAttributtedStringHeightWithMaxWidth:(CGFloat)maxWidth {
    return [self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size.height + 1;
}

- (CGFloat)getAttributtedStringWidthWithMaxHeight:(CGFloat)maxHeight {
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, maxHeight) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size.width + 1;
}

@end
