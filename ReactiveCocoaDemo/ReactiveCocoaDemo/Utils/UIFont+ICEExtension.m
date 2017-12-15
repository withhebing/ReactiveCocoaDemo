//
//  UIFont+ICEExtension.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/14.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "UIFont+ICEExtension.h"

@implementation UIFont (ICEExtension)

+ (instancetype)ice_PingFangSC_UltralightFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:kPingFangSC_Ultralight size:fontSize];
}

+ (instancetype)ice_PingFangSC_RegularFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:kPingFangSC_Regular size:fontSize];
}

+ (instancetype)ice_PingFangSC_SemiboldFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:kPingFangSC_Semibold size:fontSize];
}

+ (instancetype)ice_PingFangSC_ThinFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:kPingFangSC_Thin size:fontSize];
}

+ (instancetype)ice_PingFangSC_LightFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:kPingFangSC_Light size:fontSize];
}

+ (instancetype)ice_PingFangSC_MediumFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:kPingFangSC_Medium size:fontSize];
}

@end
