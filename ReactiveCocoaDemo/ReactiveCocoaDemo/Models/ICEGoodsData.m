//
//  ICEGoodsData.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/15.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEGoodsData.h"

@implementation ICEGoodsData

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"data" : [ICEGoods class]
             };
}

@end
