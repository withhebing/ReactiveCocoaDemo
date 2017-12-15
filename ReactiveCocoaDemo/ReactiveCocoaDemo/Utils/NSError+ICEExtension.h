//
//  NSError+ICEExtension.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/14.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (ICEExtension)

+ (NSString *)ice_messageFromError:(NSError *)error;

@end
