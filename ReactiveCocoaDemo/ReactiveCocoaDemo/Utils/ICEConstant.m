//
//  ICEConstant.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/12.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEConstant.h"


//// 左、右距离屏幕的间距 12
CGFloat const ICEGlobalViewLeftOrRightMargin = 12;
/// 顶部、底部、中间间距 距离屏幕的间距 10
CGFloat const ICEGlobalViewInnerMargin = 10;

//// 登录的手机号
NSString *const ICELoginPhoneKey = @"ICELoginPhoneKey";
//// 登录的验证码
NSString *const ICELoginVerifyCodeKey = @"ICELoginVerifyCodeKey";


/// 项目中关于一些简单的业务逻辑验证放在ViewModel的命令中统一处理 NSError
/// eg：假设验证出来不是正确的手机号：
/// [RACSignal error:[NSError errorWithDomain:ICECommandErrorDomain code:ICECommandErrorCode userInfo:@{ICECommandErrorUserInfoKey:@"请输入正确的手机号码"}]];
NSString *const ICECommandErrorDomain = @"ICECommandErrorDomain";
NSString *const ICECommandErrorUserInfoKey = @"ICECommandErrorUserInfoKey";
NSInteger const ICECommandErrorCode = 7438;

/// 搜索tips
NSString *const ICESearchTipsText = @"输入你要找的宝贝";


////////////////// MVVM ViewModel Params中的key //////////////////
/// MVVM View
/// The base map of 'params'
/// The `params` parameter in `-initWithParams:` method.
/// Key-Values's key
/// 传递唯一ID的key：例如：商品id 用户id...
NSString *const ICEViewModelIDKey = @"ICEViewModelIDKey";
/// 传递导航栏title的key：例如 导航栏的title...
NSString *const ICEViewModelTitleKey = @"ICEViewModelTitleKey";
/// 传递数据模型的key：例如 商品模型的传递 用户模型的传递...
NSString *const ICEViewModelUtilKey = @"ICEViewModelUtilKey";
/// 传递webView Request的key：例如 webView request...
NSString *const ICEViewModelRequestKey = @"ICEViewModelRequestKey";


@implementation ICEConstant

@end
