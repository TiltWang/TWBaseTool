//
//  NSDate+Extension.h
//  ClassOnlineModule
//
//  Created by Tilt on 2018/12/5.
//  Copyright © 2018年 Tilt. All rights reserved.
//

#import <Foundation/Foundation.h>

#define D_MINUTE    60
#define D_HOUR        3600
#define D_DAY        86400
#define D_WEEK        604800
#define D_YEAR        31556926

//凌晨0:00-6:00,上午 6:00-12:00,中午12:00-14:00,下午14:00-18:00,晚上18:00-21:00;深夜:21:00-24:00
typedef NS_ENUM(NSUInteger, TimeBucketType) {
    TimeBucketTypeEarlyMorning      = 1 << 0, //凌晨0:00-6:00
    TimeBucketTypeMorning           = 1 << 1, //上午6:00--12:00
    TimeBucketTypeNoon              = 1 << 2, //中午12:00-14:00
    TimeBucketTypeAfternoon         = 1 << 3, //下午14:00-18:00
    TimeBucketTypeNight             = 1 << 4, //晚上18:00-21:00
    TimeBucketTypeLateNight         = 1 << 5, //深夜:21:00-24:00
};

@interface NSDate (Extension)

///获取时间
+ (NSTimeInterval)timeStamp;

- (NSString*)timeIntervalDescription;//距离当前的时间间隔描述
- (NSString*)minuteDescription;/*精确到分钟的日期描述*/
- (NSString*)formattedTime;
- (NSString *)yyyyMMddFormatted;
- (NSString*)formattedDateDescription;//格式化日期描述
- (double)timeIntervalSince1970InMilliSecond;
+ (NSDate*)dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond;
+ (NSString*)formattedTimeFromTimeInterval:(long long)time;
+ (NSString*)formattedCreatTimeFromTimeInterval:(long long)time;
// Relative dates from the current date
+ (NSDate*)dateTomorrow;
+ (NSDate*)dateYesterday;
+ (NSDate*)dateWithDaysFromNow:(NSInteger)days;
+ (NSDate*)dateWithDaysBeforeNow:(NSInteger)days;
+ (NSDate*)dateWithHoursFromNow:(NSInteger)dHours;
+ (NSDate*)dateWithHoursBeforeNow:(NSInteger)dHours;
+ (NSDate*)dateWithMinutesFromNow:(NSInteger)dMinutes;
+ (NSDate*)dateWithMinutesBeforeNow:(NSInteger)dMinutes;

// Comparing dates
- (BOOL)isEqualToDateIgnoringTime: (NSDate *) aDate;
- (BOOL)isToday;
- (BOOL)isTomorrow;
- (BOOL)isYesterday;
- (BOOL)isSameWeekAsDate: (NSDate *) aDate;
- (BOOL)isThisWeek;
- (BOOL)isNextWeek;
- (BOOL)isLastWeek;
- (BOOL)isSameMonthAsDate: (NSDate *) aDate;
- (BOOL)isThisMonth;
- (BOOL)isSameYearAsDate: (NSDate *) aDate;
- (BOOL)isThisYear;
- (BOOL)isNextYear;
- (BOOL)isLastYear;
- (BOOL)isEarlierThanDate: (NSDate *) aDate;
- (BOOL)isLaterThanDate: (NSDate *) aDate;
- (BOOL)isInFuture;
- (BOOL)isInPast;

// Date roles
- (BOOL)isTypicallyWorkday;
- (BOOL)isTypicallyWeekend;

// Adjusting dates
- (NSDate*)dateByAddingDays:(NSInteger)dDays;
- (NSDate*)dateBySubtractingDays:(NSInteger)dDays;
- (NSDate*)dateByAddingHours:(NSInteger)dHours;
- (NSDate*)dateBySubtractingHours:(NSInteger)dHours;
- (NSDate*)dateByAddingMinutes:(NSInteger)dMinutes;
- (NSDate*)dateBySubtractingMinutes:(NSInteger)dMinutes;
- (NSDate*)dateAtStartOfDay;

// Retrieving intervals
- (NSInteger)minutesAfterDate:(NSDate*)aDate;
- (NSInteger)minutesBeforeDate:(NSDate*)aDate;
- (NSInteger)hoursAfterDate:(NSDate*)aDate;
- (NSInteger)hoursBeforeDate:(NSDate*)aDate;
- (NSInteger)daysAfterDate:(NSDate*)aDate;
- (NSInteger)daysBeforeDate:(NSDate*)aDate;
- (NSInteger)distanceInDaysToDate:(NSDate*)anotherDate;

// Decomposing dates
@property (readonly) NSInteger nearestHour;
@property (readonly) NSInteger hour;
@property (readonly) NSInteger minute;
@property (readonly) NSInteger seconds;
@property (readonly) NSInteger day;
@property (readonly) NSInteger month;
@property (readonly) NSInteger week;
@property (readonly) NSInteger weekday;
@property (readonly) NSInteger nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger year;

//将时间点转化成日历形式
+ (NSDate *)getCustomDateWithHour:(NSInteger)hour;
//获取时间段
+ (TimeBucketType)getTheTimeBucket;

@end
