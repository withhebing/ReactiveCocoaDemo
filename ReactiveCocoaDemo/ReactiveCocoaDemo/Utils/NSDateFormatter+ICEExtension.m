//
//  NSDateFormatter+ICEExtension.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/20.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "NSDateFormatter+ICEExtension.h"

@implementation NSDateFormatter (ICEExtension)

+ (instancetype)ice_dateFormatter {
    return [[self alloc] init];
}

+ (instancetype)ice_dateFormatterWithFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[self alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (instancetype)ice_defaultDateFormatter {
    return [self ice_dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

@end
