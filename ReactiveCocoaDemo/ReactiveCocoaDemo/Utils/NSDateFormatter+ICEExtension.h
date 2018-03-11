//
//  NSDateFormatter+ICEExtension.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/20.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (ICEExtension)

+ (instancetype)ice_dateFormatter;

+ (instancetype)ice_dateFormatterWithFormat:(NSString *)dateFormat;

+ (instancetype)ice_defaultDateFormatter;    // yyyy/MM/dd HH:mm:ss

@end
