//
//  ICEGoodsViewModel.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/14.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEGoodsViewModel.h"

@interface ICEGoodsViewModel ()

@property (nonatomic, copy, readwrite) NSArray<NSString *> *bannerUrls;

@property (nonatomic, strong, readwrite) RACCommand *requestBannerDataCommand;

@property (nonatomic, copy, readwrite) NSArray *banners;
@property (nonatomic, copy, readwrite) NSArray *goods;

// 点击头像
@property (nonatomic, strong, readwrite) RACSubject *didClickAvatarSubject;
// 点击位置
@property (nonatomic, strong, readwrite) RACSubject *didClickLocationSubject;
// 点击回复
@property (nonatomic, strong, readwrite) RACSubject *didClickReplySubject;
// 点击点赞
@property (nonatomic, strong, readwrite) RACCommand *favorCommand;

@end

@implementation ICEGoodsViewModel

#pragma mark - Override

- (void)initialize {
    [super initialize];

    self.shouldRequestRemoteDataOnViewDidLoad = NO;

    self.shouldPullDownToRefresh = YES;
    self.shouldPullUpToLoadMore = YES;

    @weakify(self);
    self.requestBannerDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        @weakify(self);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            @strongify(self);
            // 模拟网络请求, 请求banner数据
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSData *data = [NSData dataNamed:@"SUBannerData.data"];
                
            });
            return nil;
        }];
    }];
}

@end
