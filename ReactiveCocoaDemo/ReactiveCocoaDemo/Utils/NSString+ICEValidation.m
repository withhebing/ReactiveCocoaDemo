//
//  NSString+ICEValidation.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/14.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "NSString+ICEValidation.h"

@implementation NSString (ICEValidation)

+ (BOOL)ice_isContainsChineseCharacters:(NSString *)string {
    for (int i = 0; i < string.length; i++) {
        int a = [string characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}

+ (BOOL)ice_isPureInt:(NSString *)string {
    NSScanner *scanner = [NSScanner scannerWithString:string];
    int val;
    return [scanner scanInt:&val] && [scanner isAtEnd];
}

+ (BOOL)ice_isPureFloat:(NSString *)string {
    NSScanner *scanner = [NSScanner scannerWithString:string];
    float val;
    return [scanner scanFloat:&val] && [scanner isAtEnd];
}

+ (BOOL)ice_isValidMobile:(NSString *)string {
    NSString *regex = @"^1[34578]\\d{9}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:string];
}

+ (BOOL)ice_isValidEmail:(NSString *)string {
    // ^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$
    // ^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$
    // ^[A-Za-zd]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$
    NSString *regex = @"^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:string];
}

+ (BOOL)ice_isDecimalDigitCharacters:(NSString *)string {
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if (string.length > 0) {
        return NO;
    }
    return YES;
}

+ (BOOL)ice_isValidCharacterOrNumber:(NSString *)string {
    NSString *regex = @"^[a-z0－9A-Z]*$";    // 数字或英文, 或两者都存在
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:string];
}

@end
