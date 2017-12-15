//
//  ICETableViewModel.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/15.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICETableViewModel.h"

@interface ICETableViewModel ()

@property (nonatomic, strong, readwrite) RACCommand *requestRemoteDataCommand;

@end

@implementation ICETableViewModel

- (void)initialize {
    [super initialize];

    self.page = 1;
    self.perPage = 100;
    self.lastPage = 1;

    @weakify(self);
    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSNumber *page) {
        @strongify(self);
        return [[self requestRemoteDataSignalWithPage:page.unsignedIntegerValue]
                takeUntil:self.rac_willDeallocSignal];
    }];

    [[self.requestRemoteDataCommand.errors
      filter:[self requestRemoteDataErrorsFilter]]
     subscribe:self.errors];
}

- (BOOL (^)(NSError *))requestRemoteDataErrorsFilter {
    return ^(NSError *error) {
        return YES;
    };
}

- (id)fetchLocalData {
    return nil;
}

- (NSUInteger)offsetForPage:(NSUInteger)page {
    return (page - 1) * self.perPage;
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
    return [RACSignal empty];
}

@end
