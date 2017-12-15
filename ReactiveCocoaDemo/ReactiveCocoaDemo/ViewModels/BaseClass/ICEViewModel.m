//
//  ICEViewModel.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/12.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEViewModel.h"

@interface ICEViewModel ()

@property (nonatomic, strong, readwrite) id<ICEViewModelServices> services;
@property (nonatomic, copy, readwrite) NSDictionary *params;

@property (nonatomic, strong, readwrite) RACSubject *errors;
@property (nonatomic, strong, readwrite) RACSubject *willDisappearSignal;

@end

@implementation ICEViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    ICEViewModel *viewModel = [super allocWithZone:zone];

//    @weakify(viewModel)
//    [[viewModel rac_signalForSelector:@selector(initWithServices:params:)] subscribeNext:^(RACTuple * _Nullable x) {
//        @strongify(viewModel)
//        [viewModel initialize];
//    }];

    @weakify(viewModel)
    [[viewModel rac_signalForSelector:@selector(initWithParams:)]
     subscribeNext:^(RACTuple * _Nullable x) {
         @strongify(viewModel)
         [viewModel initialize];
     }];

    return viewModel;
}

- (instancetype)initWithServices:(id<ICEViewModelServices>)services params:(NSDictionary *)params {
    self = [super init];
    if (self) {
        self.shouldFetchLocalDataOnViewModelInitialize = YES;
        self.shouldRequestRemoteDataOnViewDidLoad = YES;
        self.title = params[ICEViewModelTitleKey];
        self.services = services;
        self.params = params;
    }
    return self;
}

- (instancetype)initWithParams:(NSDictionary *)params {
    self = [super init];
    if (self) {
        self.shouldFetchLocalDataOnViewModelInitialize = YES;
        self.shouldRequestRemoteDataOnViewDidLoad = YES;
        self.title = params[ICEViewModelTitleKey];
        self.params = params;
    }
    return self;
}

- (RACSubject *)errors {
    if (!_errors) {
        _errors = [RACSubject subject];
    }
    return _errors;
}

- (RACSubject *)willDisappearSignal {
    if (!_willDisappearSignal) {
        _willDisappearSignal = [RACSubject subject];
    }
    return _willDisappearSignal;
}

/// subclass can override
- (void)initialize {

}

@end
