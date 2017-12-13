//
//  ICEConstant.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/12.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Availability.h>

///------
/// NSLog
///------

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif

#ifdef DEBUG
// 格式: [时间] [方法名] [行数] [输出内容]
#define ICELog(format, ...) printf("\n[%s] %s [第%zd行] 💕 %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ##__VA_ARGS__] UTF8String]);
#else
#define ICELog(format, ...)
#endif

#define ICELogError(error) NSLog(@"Error: %@", error)
#define ICELogFunc NSLog(@"%s", __func__)
#define ICEDealloc NSLog(@"\n =========+++ %@  销毁了 +++======== \n",[self class])

///------
/// Block
///------

typedef void (^VoidBlock)();
typedef BOOL (^BoolBlock)();
typedef int  (^IntBlock) ();
typedef id   (^IDBlock)  ();

typedef void (^VoidBlock_int)(int);
typedef BOOL (^BoolBlock_int)(int);
typedef int  (^IntBlock_int) (int);
typedef id   (^IDBlock_int)  (int);

typedef void (^VoidBlock_string)(NSString *);
typedef BOOL (^BoolBlock_string)(NSString *);
typedef int  (^IntBlock_string) (NSString *);
typedef id   (^IDBlock_string)  (NSString *);

typedef void (^VoidBlock_id)(id);
typedef BOOL (^BoolBlock_id)(id);
typedef int  (^IntBlock_id) (id);
typedef id   (^IDBlock_id)  (id);

///------
/// Color
///------

// 随机色
#define ICERandomColor RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define RGB(r, g, b) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

///---------
/// App Info
///---------

#define ICEApplicationVersionKey @"ICEApplicationVersionKey"

#define ICE_APP_ID               @""    //
#define ICE_APP_STORE_URL        @"https://itunes.apple.com/cn/app/id"ICE_APP_ID"?mt=8"
#define ICE_APP_STORE_REVIEW_URL @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id="ICE_APP_ID@"&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software"

#define ICE_APP_NAME    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"])
#define ICE_APP_VERSION ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define ICE_APP_BUILD   ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])

///------------
/// UMengSocial
///------------

#define ICE_UM_APP_KEY   @""
#define ICE_UM_SHARE_URL @""

// Wechat
#define ICE_WX_APP_ID     @""
#define ICE_WX_APP_SECRET @""

// Sina Weibo
#define ICE_WEIBO_APP_KEY      @""
#define ICE_WEIBO_APP_SECRET   @""
#define ICE_WEIBO_REDIRECT_URL @""

// QQ
#define ICE_QQ_APP_ID            @""
#define ICE_QQ_APP_KEY           @""
#define ICE_TENCENT_REDIRECT_URL @""

///-----
/// FMDB
///-----

#define ICE_FMDB_PATH [NSString stringWithFormat:@"%@/%@.db", ICE_DOCUMENT_DIRECTORY, ICE_APP_NAME]
#define ICELogLastError(db) NSLog(@"lastError: %@, lastErrorCode: %d, lastErrorMessage: %@", [db lastError], [db lastErrorCode], [db lastErrorMessage]);

///-------------
/// Notification
///-------------

#define ICEStarredReposDidChangeNotification   @"ICEStarredReposDidChangeNotification"
#define ICERecentSearchesDidChangeNotification @"ICERecentSearchesDidChangeNotification"

///--------
/// Bugtags
///--------

#define ICE_BUGTAGS_APP_KEY @""







#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5  (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6  (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_X  (IS_IPHONE && SCREEN_MAX_LENGTH == 812.0)

#define SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_BOUNDS ([[UIScreen mainScreen] bounds])
#define SCREEN_SIZE   ([[UIScreen mainScreen] bounds].size)



// KVO获取监听对象的属性 有自动提示
// 宏里面的#，会自动把后面的参数变成c语言的字符串
#define ICEKeyPath(objc,keyPath) @(((void)objc.keyPath ,#keyPath))


// 是否为空对象
#define ICEObjectIsNil(__object)  ((nil == __object) || [__object isKindOfClass:[NSNull class]])
// 字符串为空
#define ICEStringIsEmpty(__string) ((__string.length == 0) || ICEObjectIsNil(__string))
// 字符串不为空
#define ICEStringIsNotEmpty(__string)  (!ICEStringIsEmpty(__string))
// 数组为空
#define ICEArrayIsEmpty(__array) ((ICEObjectIsNil(__array)) || (__array.count==0))

// App Document 文件夹路径
#define ICE_DOCUMENT_DIRECTORY NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject
// App Caches 文件夹路径
#define ICE_CACHES_DIRECTORY NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject


// 系统放大倍数
#define ICEScale [[UIScreen mainScreen] scale]

#define ICE_1PX_WIDTH (1 / [UIScreen mainScreen].scale)

#define ICEImageNamed(__imageName) [UIImage imageNamed:__imageName]


/// 适配iPhone X + iOS 11
#define  ICEAdjustsScrollViewInsets_Never(__scrollView)\
do {\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
if ([__scrollView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
NSInteger argument = 2;\
invocation.target = __scrollView;\
invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
[invocation setArgument:&argument atIndex:2];\
[invocation retainArguments];\
[invocation invoke];\
}\
_Pragma("clang diagnostic pop")\
} while (0)



/// 导航条高度
#define ICE_APPLICATION_TOP_BAR_HEIGHT (IS_IPHONE_X?88.0f:64.0f)
/// tabBar高度
#define ICE_APPLICATION_TAB_BAR_HEIGHT (IS_IPHONE_X?83.0f:49.0f)
/// 工具条高度 (常见的高度)
#define ICE_APPLICATION_TOOL_BAR_HEIGHT_44  44.0f
#define ICE_APPLICATION_TOOL_BAR_HEIGHT_49  49.0f
/// 状态栏高度
#define ICE_APPLICATION_STATUS_BAR_HEIGHT (IS_IPHONE_X?44:20.0f)



/// 全局细下滑线颜色 以及分割线颜色
#define ICEGlobalBottomLineColor     [UIColor colorFromHexString:@"#D9D9D9"]

/// 全局粉红色
#define ICEGlobalPinkColor [UIColor colorFromHexString:@"#FE8491"]
/// 全局浅粉红色
#define ICEGlobalShadowPinkColor [UIColor colorFromHexString:@"#FFF1F2"]
/// 全局亮红色
#define ICEGlobalLightRedColor [UIColor colorFromHexString:@"#FE583E"]
/// 全局灰色背景
#define ICEGlobalGrayBackgroundColor [UIColor colorFromHexString:@"#EEEFF4"]
/// 全局浅灰色字体
#define ICEGlobalShadowGrayTextColor [UIColor colorFromHexString:@"#9CA1B2"]
/// 全局黑色字体
#define ICEGlobalBlackTextColor      [UIColor colorFromHexString:@"#3C3E44"]
/// 全局浅黑色字体
#define ICEGlobalShadowBlackTextColor      [UIColor colorFromHexString:@"#56585f"]


/// 左、右距离屏幕的间距 12
FOUNDATION_EXTERN CGFloat const ICEGlobalViewLeftOrRightMargin;
/// 顶部、底部、中间间距 距离屏幕的间距 10
FOUNDATION_EXTERN CGFloat const ICEGlobalViewInnerMargin;

/// 登录的手机号
FOUNDATION_EXTERN NSString *const ICELoginPhoneKey;
/// 登录的验证码
FOUNDATION_EXTERN NSString *const ICELoginVerifyCodeKey;

/// 项目中关于一些简单的业务逻辑验证放在ViewModel的命令中统一处理 NSError
/// eg：假设验证出来不是正确的手机号：
/// [RACSignal error:[NSError errorWithDomain:ICECommandErrorDomain code:ICECommandErrorCode userInfo:@{ICECommandErrorUserInfoKey:@"请输入正确的手机号码"}]];
FOUNDATION_EXTERN NSString *const ICECommandErrorDomain;
FOUNDATION_EXTERN NSString *const ICECommandErrorUserInfoKey;
FOUNDATION_EXTERN NSInteger const ICECommandErrorCode;

/// 搜索tips
FOUNDATION_EXTERN NSString *const ICESearchTipsText;


////////////////// MVVM ViewModel Params中的key //////////////////
/// MVVM View
/// The base map of 'params'
/// The `params` parameter in `-initWithParams:` method.
/// Key-Values's key
/// 传递唯一ID的key：例如：商品id 用户id...
FOUNDATION_EXTERN NSString *const ICEViewModelIDKey;
/// 传递导航栏title的key：例如 导航栏的title...
FOUNDATION_EXTERN NSString *const ICEViewModelTitleKey;
/// 传递数据模型的key：例如 商品模型的传递 用户模型的传递...
FOUNDATION_EXTERN NSString *const ICEViewModelUtilKey;
/// 传递webView Request的key：例如 webView request...
FOUNDATION_EXTERN NSString *const ICEViewModelRequestKey;

@interface ICEConstant : NSObject

@end
