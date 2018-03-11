//
//  ICEGoodsData.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/15.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEModel.h"
#import "ICEGoods.h"

@interface ICEGoodsData : ICEModel

@property (nonatomic, assign, readwrite) NSInteger total;
@property (nonatomic, assign, readwrite) NSInteger perPage;
@property (nonatomic, assign, readwrite) NSInteger currentPage;
@property (nonatomic, assign, readwrite) NSInteger lastPage;
@property (nonatomic, assign, readwrite) NSInteger from;
@property (nonatomic, assign, readwrite) NSInteger to;

@property (nonatomic, copy, readwrite) NSArray<ICEGoods *> *data;

@end
