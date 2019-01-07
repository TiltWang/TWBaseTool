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

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define HEXACOLOR(hex,a) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:a]

#define HEXCOLOR(hex) HEXACOLOR(hex,1.0f)



///设置debug下打印
#ifdef DEBUG
#define TWLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define TWLog(format, ...)
#endif

//AppDelegate
#define APP_DELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)
// App 语言
#define APP_LANGUAGE [[NSUserDefaults standardUserDefaults] objectForKey:@"AppLanguage"]

// 应用程序的名字
#define APP_NAME [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]

// 应用程序版本号
#define APP_VERSION [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]

// 应用程序BundleId
#define APP_BUNDLEID [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"]

// 应用程序BuildId
#define APP_BUILDID [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]

//非空判断 宏
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

//判断是否为真机
#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

#define kVideoHeight(width)     (width * 9.0 / 16)

#endif /* __OBJC__ */


#pragma mark - weak / strong
#define TW_WeakSelf        @TW_Weakify(self);
#define TW_StrongSelf      @TW_Strongify(self);

/*！
 * 强弱引用转换，用于解决代码块（block）与强引用self之间的循环引用问题
 * 调用方式: `@TW_Weakify`实现弱引用转换，`@TW_Strongify`实现强引用转换
 *
 * 示例：
 * @TW_Weakify
 * [obj block:^{
 * @strongify_self
 * self.property = something;
 * }];
 */
#ifndef TW_Weakify
#if DEBUG
#if __has_feature(objc_arc)
#define TW_Weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define TW_Weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define TW_Weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define TW_Weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

/*！
 * 强弱引用转换，用于解决代码块（block）与强引用对象之间的循环引用问题
 * 调用方式: `@TW_Weakify(object)`实现弱引用转换，`@TW_Strongify(object)`实现强引用转换
 *
 * 示例：
 * @TW_Weakify(object)
 * [obj block:^{
 * @TW_Strongify(object)
 * strong_object = something;
 * }];
 */
#ifndef TW_Strongify
#if DEBUG
#if __has_feature(objc_arc)
#define TW_Strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define TW_Strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define TW_Strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define TW_Strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif /* TWBaseTool_h */
