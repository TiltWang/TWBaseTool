//
//  NSAttributedString+TWExtension.h
//  TWBaseTool
//
//  Created by Tilt on 2018/12/11.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (TWExtension)

///获取AttributtedStr高度
- (CGFloat)getAttributtedStringHeightWithMaxWidth:(CGFloat)maxWidth;

///获取AttributtedStr宽度
- (CGFloat)getAttributtedStringWidthWithMaxHeight:(CGFloat)maxHeight;

@end
