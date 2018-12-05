//
//  NSDateFormatter+Extension.h
//  ClassOnlineModule
//
//  Created by Tilt on 2018/12/5.
//  Copyright © 2018年 Tilt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Extension)

+ (id)dateFormatter;
+ (id)dateFormatterWithFormat:(NSString *)dateFormat;
+ (id)defaultDateFormatter;/*yyyy-MM-dd HH:mm:ss*/

@end
