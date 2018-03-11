//
//  NSDate+ICEExtension.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/20.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDateFormatter+ICEExtension.h"

#define ICE_D_MINUTE        60
#define ICE_D_HOUR        3600
#define ICE_D_DAY        86400
#define ICE_D_WEEK        604800
#define ICE_D_YEAR        31556926

@interface NSDate (ICEExtension)

/**
 *  是否为今天
 */
- (BOOL)ice_isToday;
/**
 *  是否为昨天
 */
- (BOOL)ice_isYesterday;
/**
 *  是否为今年
 */
- (BOOL)ice_isThisYear;
/**
 *  是否本周
 */
- (BOOL)ice_isThisWeek;

/**
 *  星期几
 */
- (NSString *)ice_weekDay;

/**
 *  是否为在相同的周
 */
- (BOOL)ice_isSameWeekWithAnotherDate: (NSDate *)anotherDate;


/**
 *  通过一个时间 固定的时间字符串 "2016/8/10 14:43:45" 返回时间
 *  @param timestamp 固定的时间字符串 "2016/8/10 14:43:45"
 */
+ (instancetype)ice_dateWithTimestamp:(NSString *)timestamp;

/**
 *  返回固定的 当前时间 2016-8-10 14:43:45
 */
+ (NSString *)ice_currentTimestamp;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)ice_dateWithYMD;

/**
 * 格式化日期描述
 */
- (NSString *)ice_formattedDateDescription;

/** 与当前时间的差距 */
- (NSDateComponents *)ice_deltaWithNow;



//////////// MVC&MVVM的商品的发布时间的描述 ////////////
- (NSString *)ice_string_yyyy_MM_dd;
- (NSString *)ice_string_yyyy_MM_dd:(NSDate *)toDate;

@end
