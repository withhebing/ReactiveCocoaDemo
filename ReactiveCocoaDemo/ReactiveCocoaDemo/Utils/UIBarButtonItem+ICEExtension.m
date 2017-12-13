//
//  UIBarButtonItem+ICEExtension.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/12.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "UIBarButtonItem+ICEExtension.h"

@implementation UIBarButtonItem (ICEExtension)

+ (UIBarButtonItem *)ice_itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action {
    UIButton *button = [[UIButton alloc] init];

    if(imageName) [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if(highImageName) [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
//    button.frame = CGRectMake(0, 0, 100, 44);

    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];

    return item;
}

+ (UIBarButtonItem *)ice_itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action {
    return [UIBarButtonItem ice_itemWithImageName:imageName highImageName:nil target:target action:action];
}

@end
