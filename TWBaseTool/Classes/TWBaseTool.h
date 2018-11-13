//
//  TWBaseTool.h
//  TWBaseTool
//
//  Created by Tilt on 2018/11/12.
//  Copyright © 2018年 tilt. All rights reserved.
//

#ifndef TWBaseTool_h
#define TWBaseTool_h

#import "TWUtil.h"

#if __OBJC__

#define GetImage(imageName) [UIImage imageNamed:imageName]
#define GetFont(x) [UIFont systemFontOfSize:x]

///测试用 随机色
#define RandomColor [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0]

///设置debug下打印
#ifdef DEBUG
#define NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif

//非空判断 宏
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

//判断是否为真机
#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif

#endif /* __OBJC__ */

#endif /* TWBaseTool_h */
