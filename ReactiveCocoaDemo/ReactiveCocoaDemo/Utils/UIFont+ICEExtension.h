//
//  UIFont+ICEExtension.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/14.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

/* 苹方字体
 "PingFangSC-Ultralight",   // 苹方极细体
 "PingFangSC-Regular",      // 苹方常规体
 "PingFangSC-Semibold",     // 苹方中粗体
 "PingFangSC-Thin",         // 苹方纤细体
 "PingFangSC-Light",        // 苹方细体
 "PingFangSC-Medium"        // 苹方中黑体
 */

static NSString *const kPingFangSC_Ultralight = @"PingFangSC-Ultralight";
static NSString *const kPingFangSC_Regular = @"PingFangSC-Regular";
static NSString *const kPingFangSC_Semibold = @"PingFangSC-Semibold";
static NSString *const kPingFangSC_Thin = @"PingFangSC-Thin";
static NSString *const kPingFangSC_Light = @"PingFangSC-Light";
static NSString *const kPingFangSC_Medium = @"PingFangSC-Medium";

// 由于苹方字体 iOS9.0+, 需要适配

// 系统字体 (__blod__, YES: 粗体, NO: 常规)
#define ICEFont(__size__,__bold__) ((__bold__)?([UIFont boldSystemFontOfSize:__size__]):([UIFont systemFontOfSize:__size__]))
// 极细体
#define ICEUltralightFont(__size__) [UIFont ice_PingFangSC_UltralightFontOfSize:__size__]
// 纤细体
#define ICEThinFont(__size__)       [UIFont ice_PingFangSC_ThinFontOfSize:__size__]
// 细体
#define ICELightFont(__size__)      [UIFont ice_PingFangSC_LightFontOfSize:__size__]
// 中黑体
#define ICEMediumFont(__size__)     ((ICEIOSVersion<9.0)?ICEFont(__size__, YES):[UIFont ice_PingFangSC_MediumFontOfSize:__size__])
// 常规体
#define ICERegularFont(__size__)    ((ICEIOSVersion<9.0)?ICEFont(__size__, NO):[UIFont ice_PingFangSC_RegularFontOfSize:__size__])
// 中粗体
#define ICESemiboldFont(__size__)   ((ICEIOSVersion<9.0)?ICEFont(__size__, YES):[UIFont ice_PingFangSC_SemiboldFontOfSize:__size__])


@interface UIFont (ICEExtension)

+ (instancetype)ice_PingFangSC_UltralightFontOfSize:(CGFloat)fontSize;
+ (instancetype)ice_PingFangSC_RegularFontOfSize:(CGFloat)fontSize;
+ (instancetype)ice_PingFangSC_SemiboldFontOfSize:(CGFloat)fontSize;
+ (instancetype)ice_PingFangSC_ThinFontOfSize:(CGFloat)fontSize;
+ (instancetype)ice_PingFangSC_LightFontOfSize:(CGFloat)fontSize;
+ (instancetype)ice_PingFangSC_MediumFontOfSize:(CGFloat)fontSize;

@end
