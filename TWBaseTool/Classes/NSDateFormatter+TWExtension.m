//
//  NSDateFormatter+TWExtension.m
//  TWBaseTool
//
//  Created by Tilt on 2018/12/11.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import "NSDateFormatter+TWExtension.h"

@implementation NSDateFormatter (TWExtension)

+ (id)dateFormatter {
    return [[self alloc] init];
}

+ (id)dateFormatterWithFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[self alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (id)defaultDateFormatter {
    return [self dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

@end
