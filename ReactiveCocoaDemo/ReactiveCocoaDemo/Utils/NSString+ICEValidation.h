//
//  NSString+ICEValidation.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/14.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ICEValidation)

// 检测字符串是否包含中文字符
+ (BOOL)ice_isContainsChineseCharacters:(NSString *)string;

/// 整型
+ (BOOL)ice_isPureInt:(NSString *)string;

/// 浮点型
+ (BOOL)ice_isPureFloat:(NSString *)string;

/// 有效手机号码
+ (BOOL)ice_isValidMobile:(NSString *)string;

/// 有效邮箱地址
+ (BOOL)ice_isValidEmail:(NSString *)string;

/// 纯数字
+ (BOOL)ice_isDecimalDigitCharacters:(NSString *)string;

/// 字符串为字母或数字
+ (BOOL)ice_isValidCharacterOrNumber:(NSString *)string;

@end
