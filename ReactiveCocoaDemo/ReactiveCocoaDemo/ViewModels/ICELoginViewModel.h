//
//  ICELoginViewModel.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/13.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEViewModel.h"

@interface ICELoginViewModel : ICEViewModel

@property (nonatomic, copy, readwrite) NSString *mobilePhone;
@property (nonatomic, copy, readwrite) NSString *verifyCode;
@property (nonatomic, copy, readonly) NSString *avatarUrlStr;

/// 按钮能否点击
@property (nonatomic, strong, readonly) RACSignal *validLoginSignal;
/// 按钮点击命令
@property (nonatomic, strong, readonly) RACCommand *loginCommand;

@end
