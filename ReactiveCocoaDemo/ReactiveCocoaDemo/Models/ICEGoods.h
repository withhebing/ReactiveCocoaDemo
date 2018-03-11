//
//  ICEGoods.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/15.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEModel.h"
#import "ICEGoodsImage.h"

// 商品运费类型
typedef NS_ENUM(NSUInteger, ICEGoodsExpressType) {
    ICEGoodsExpressTypeFree = 0,     // 包邮
    ICEGoodsExpressTypeValue = 1,    // 运费
    ICEGoodsExpressTypeFeeding = 2,  // 待议
};

@interface ICEGoods : ICEModel

/// === 商品相关 ===
/// 商品ID
@property (nonatomic, readwrite, copy) NSString * goodsId;
/// 位置
@property (nonatomic, readwrite, copy) NSString * locationAreaName;
/// 商品名称
@property (nonatomic, readwrite, copy) NSString *title;
/// 商品描述
@property (nonatomic, readwrite, copy) NSString * goodsDescription;
/// 商品价格
@property (nonatomic, readwrite, copy) NSString * price;
/// 商品原价格
@property (nonatomic, readwrite, copy) NSString * oPrice;
/// 浏览次数
@property (nonatomic, readwrite, copy) NSString * hits;
/// 喜欢次数
@property (nonatomic, readwrite, copy) NSString * likes;
/// 留言数量
@property (nonatomic, readwrite, copy) NSString * messages;
/// 商品数量
@property (nonatomic, readwrite, copy) NSString * number;
/// 运费类型： 0 包邮  1 指定运费  2待议
@property (nonatomic, readwrite, assign) ICEGoodsExpressType expressType;
/// 运费
@property (nonatomic, readwrite, copy) NSString * expressFee;
/// 更新时间
@property (nonatomic, strong) NSDate * updatedAt;
/// 发布（重新发布）时间
@property (nonatomic, strong) NSDate * editAt;
/// 是否已经收藏
@property (nonatomic, assign) BOOL isLike;
/// 商品预览图片模型列表
@property (nonatomic, readwrite, copy) NSArray <ICEGoodsImage *> * images;
/// 是否全新
@property (nonatomic, readwrite, assign , getter = isBrandNew) BOOL brandNew;
/// 活动价
@property (nonatomic, readwrite, copy) NSString *activityPrice;

/// === 商品中的用户相关的信息 ===
/// 用户ID
@property (nonatomic, readwrite, copy) NSString * userId;
/// 用户头像
@property (nonatomic, readwrite, copy) NSString * avatar;
/// 用户昵称
@property (nonatomic, readwrite, copy) NSString * nickName;
/// 是否芝麻认证
@property (nonatomic, readwrite, assign) BOOL iszm;

@end