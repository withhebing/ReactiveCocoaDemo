//
//  ICEGoodsViewModel.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/14.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICETableViewModel.h"

@interface ICEGoodsViewModel : ICETableViewModel

@property (nonatomic, copy, readonly) NSArray<NSString *> *bannerUrls;

@property (nonatomic, strong, readonly) RACCommand *requestBannerDataCommand;

- (NSString *)bannerUrlWithIndex:(NSInteger)index;

@property (nonatomic, strong, readonly) RACSubject *didClickAvatarSubject;
@property (nonatomic, strong, readonly) RACSubject *didClickLocationSubject;
@property (nonatomic, strong, readonly) RACSubject *didClickReplySubject;

@end
