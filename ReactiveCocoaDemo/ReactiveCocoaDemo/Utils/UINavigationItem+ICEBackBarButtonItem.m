//
//  UINavigationItem+ICEBackBarButtonItem.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/12.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "UINavigationItem+ICEBackBarButtonItem.h"
#import <objc/runtime.h>

@implementation UINavigationItem (ICEBackBarButtonItem)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];

        SEL originalSelector = @selector(backBarButtonItem);
        SEL swizzledSelector = @selector(ice_backBarButtonItem);

        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (!success) {
            class_replaceMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        }
    });
}

#pragma mark - Method Swizzling

- (UIBarButtonItem *)ice_backBarButtonItem {
    return [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
}

@end
