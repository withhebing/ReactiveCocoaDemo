//
//  ICEGoodsViewModel.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/14.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEGoodsViewModel.h"
#import "ICEGoodsData.h"
#import "ICEBanner.h"

@interface ICEGoodsViewModel ()

@property (nonatomic, copy, readwrite) NSArray<NSString *> *bannerUrls;

@property (nonatomic, strong, readwrite) RACCommand *requestBannerDataCommand;

@property (nonatomic, copy, readwrite) NSArray<ICEBanner *> *banners;
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
                self.banners = [ICEBanner modelArrayWithJSON:data];
                self.bannerUrls = [self.banners.rac_sequence map:^NSString *(ICEBanner *banner) {
                    NSString *bannerUrlString = ICEStringIsNotEmpty(banner.image.url) ? banner.image.url : @"";
                    return bannerUrlString;
                }].array;
                [subscriber sendNext:nil];
                [subscriber sendCompleted];
            });
            return nil;
        }];
    }];

    // 初始化时间处理信号
    self.didClickReplySubject = [RACSubject subject];
    self.didClickAvatarSubject = [RACSubject subject];
    self.didClickLocationSubject = [RACSubject subject];

    // 点赞
    self.favorCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(ICEGoodsItemViewModel *itemViewModel) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // data
                ICEGoods *goods = itemViewModel.goods;
                // updata data
                goods.isLike = !goods.isLike;
                NSInteger likes = goods.isLike ? (goods.likes.integerValue+1) : (goods.likes.integerValue-1);
                goods.likes = [NSString stringWithFormat:@"%zd", likes];
                [subscriber sendNext:nil];
                [subscriber sendCompleted];
            });
            return nil;
        }];
    }];
    // 允许并行执行
    self.favorCommand.allowsConcurrentExecution = YES;
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        @strongify(self);
        NSDictionary *param = [NSDictionary dictionary];
        [param setValue:@(page) forKey:@"page"];

        // 模拟网络请求, 请求商品数据
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.75 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 获取数据
            NSData *data = [NSData dataNamed:[NSString stringWithFormat:@"SUGoodsData_%zd.data", (page)]];
            ICEGoodsData *goodsData = [ICEGoodsData modelWithJSON:data];
            // config data
            self.page = goodsData.currentPage;
            self.lastPage = goodsData.lastPage;
            self.perPage = goodsData.perPage;
            NSLog(@"----已经上拉加载第%zd页----", self.page);

            // 转化数据
            NSArray *viewModels = [goodsData.data.rac_sequence map:^ICEGoodsItemViewModel *(ICEGoods *goods) {
                @strongify(self);
                ICEGoodsItemViewModel *itemViewModel = [[ICEGoodsItemViewModel alloc] initWithGoods:goods];
                itemViewModel.didClickedLocationSubject = self.didClickLocationSubject;
                itemViewModel.didClickedAvatarSubject = self.didClickAvatarSubject;
                itemViewModel.didClickedReplySubject = self.didClickReplySubject;
                itemViewModel.operationCommand = self.favorCommand;
                return itemViewModel;
            }].array;

            if (page == 1) {
                self.dataSource = viewModels ?: [NSArray array];
            } else {
                self.dataSource = @[(self.dataSource ?: @[]).rac_sequence, viewModels.rac_sequence].rac_sequence.flatten.array; // ‘拼接’
            }

            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        });

        return nil;
    }];
}

#pragma mark - Public

- (NSString *)bannerUrlWithIndex:(NSInteger)index {
    return [self.banners[index] url];
}

@end
