//
//  NSError+ICEExtension.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/14.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "NSError+ICEExtension.h"

@implementation NSError (ICEExtension)

+ (NSString *)ice_messageFromError:(NSError *)error {
    if (error) {
        NSString *msgStr = @"";
        if (error.userInfo[@"message"]) {
            msgStr = [error.userInfo objectForKey:@"message"];
        } else if (error.domain) {
            msgStr = error.domain;
        } else {
            msgStr = error.localizedDescription;
        }
        return msgStr;
    }
    return nil;
}

@end
