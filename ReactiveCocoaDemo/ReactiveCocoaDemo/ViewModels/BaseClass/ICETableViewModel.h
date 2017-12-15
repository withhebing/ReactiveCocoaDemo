//
//  ICETableViewModel.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/15.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEViewModel.h"

@interface ICETableViewModel : ICEViewModel

/// The data source of table view. 这里不能用NSMutableArray, 因为NSMutableArray不支持KVO, 不能被RACObserve
@property (nonatomic, copy, readwrite) NSArray *dataSource;

/// The list of section titles to display in section index view.
@property (nonatomic, copy, readwrite) NSArray *sectionIndexTitles;

@property (nonatomic, assign, readwrite) NSUInteger page;
@property (nonatomic, assign, readwrite) NSUInteger perPage;
@property (nonatomic, assign, readwrite) NSUInteger lastPage;

@property (nonatomic, assign, readwrite) BOOL shouldPullDownToRefresh;
@property (nonatomic, assign, readwrite) BOOL shouldPullUpToLoadMore;
@property (nonatomic, assign, readwrite) BOOL shouldInfiniteScrolling;

@property (nonatomic, copy, readwrite) NSString *keyword;

@property (nonatomic, strong, readwrite) RACCommand *didSelectCommand;
@property (nonatomic, strong, readonly) RACCommand *requestRemoteDataCommand;

- (id)fetchLocalData;

- (BOOL (^)(NSError *error))requestRemoteDataErrorsFilter;

- (NSUInteger)offsetForPage:(NSUInteger)page;

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page;

@end
