//
//  NSDateFormatter+TWExtension.h
//  TWBaseTool
//
//  Created by Tilt on 2018/12/11.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (TWExtension)

+ (id)dateFormatter;
+ (id)dateFormatterWithFormat:(NSString *)dateFormat;
+ (id)defaultDateFormatter;/*yyyy-MM-dd HH:mm:ss*/

@end
