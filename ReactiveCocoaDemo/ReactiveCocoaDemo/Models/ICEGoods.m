//
//  ICEGoods.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/15.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEGoods.h"

@implementation ICEGoods

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"goodsId" : @[@"id", @"goodsId", @"goods_id"],
             @"goodsDescription" : @"description",
             @"oPrice" : @"oprice",
             @"brandNew" : @"isNew"
             };
}

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"images" : [ICEGoodsImage class]
             };
}

@end
