//
//  ICELoginViewModel.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/13.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICELoginViewModel.h"

@interface ICELoginViewModel ()

@property (nonatomic, copy, readwrite) NSString *avatarUrlStr;
@property (nonatomic, strong, readwrite) RACSignal *validLoginSignal;
@property (nonatomic, strong, readwrite) RACCommand *loginCommand;

@end

@implementation ICELoginViewModel

- (void)initialize {
    [super initialize];
    ICELogFunc;

    @weakify(self);

    // 用户头像数据绑定
    RAC(self, avatarUrlStr) = [[RACObserve(self, mobilePhone)
                                map:^NSString *(NSString *mobilePhone) {
                                    // 模拟从数据库获取用户头像数据, 此处采用模拟数据
                                    return ![NSString ice_isValidMobile:mobilePhone] ? nil : ICE_USER_AVATAR;
                                }]
                               distinctUntilChanged];

    // 按钮有效性
    self.validLoginSignal = [[RACSignal
                              combineLatest:@[RACObserve(self, mobilePhone), RACObserve(self, verifyCode)]
                              reduce:^(NSString *mobilePhone, NSString *verifyCode) {
                                  return @(mobilePhone.length > 0 && verifyCode.length > 0);
                              }]
                             distinctUntilChanged];

    // 登录命令
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        NSLog(@"执行命令, login");
        @strongify(self);
        if (![NSString ice_isValidMobile:self.mobilePhone]) {
            return [RACSignal error:[NSError errorWithDomain:ICECommandErrorDomain code:ICECommandErrorCode userInfo:@{ICECommandErrorUserInfoKey : @"请输入正确的手机号码"}]];
        }
        if (![NSString ice_isDecimalDigitCharacters:self.verifyCode] || self.verifyCode.length != 4) {
            return [RACSignal error:[NSError errorWithDomain:ICECommandErrorDomain code:ICECommandErrorCode userInfo:@{ICECommandErrorUserInfoKey : @"验证码错误"}]];
        }

        @weakify(self);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            @strongify(self);
            @weakify(self);
            // 模拟网络请求, 发起登录
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                @strongify(self);
                // 简单起见, 此处存到userDefaults
                [[NSUserDefaults standardUserDefaults] setValue:self.mobilePhone forKey:ICELoginPhoneKey];
                [[NSUserDefaults standardUserDefaults] setValue:self.verifyCode forKey:ICELoginVerifyCodeKey];
                [[NSUserDefaults standardUserDefaults] synchronize];

#if 1   // success
                // 保存用户数据

                [subscriber sendNext:nil];
                [subscriber sendCompleted]; // 注意: 数据传递完, 最好调用sendCompleted, 这是命令才执行完毕

#else   // failure
                [subscriber sendError:[NSError errorWithDomain:ICECommandErrorDomain code:ICECommandErrorCode userInfo:@{ICECommandErrorUserInfoKey : @"网络错误..."}]];
#endif
            });

            return nil;
        }];
    }];
}

@end
