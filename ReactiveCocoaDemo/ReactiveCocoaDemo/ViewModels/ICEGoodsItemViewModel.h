//
//  ICEGoodsItemViewModel.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/15.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICEGoods.h"

@interface ICEGoodsItemViewModel : NSObject

/// 商品模型
@property (nonatomic, readonly, strong) ICEGoods *goods;

//// ------ 商品模型属性 -----

/// 商品数量
@property (nonatomic, readonly, copy) NSString *number;

/// 商品图片UrlString
@property (nonatomic, readonly, copy) NSArray <NSString *> *imagesUrlStrings;
/// 运费情况
@property (nonatomic, readonly, copy) NSString *freightExplain;

/// 发布时间描述
@property (nonatomic, readonly, copy) NSString *goodsPublishTime;

/// 商品价格的富文本
@property (nonatomic, readonly, copy) NSAttributedString *goodsPriceAttributedString;

/// 商品原价的富文本
@property (nonatomic, readonly, copy) NSAttributedString *goodsOPriceAttributedString;

/// 全新+title
@property (nonatomic, readonly, copy) NSAttributedString *goodsTitleAttributedString;


//// ------ 商品尺寸属性 -----
/** cellHeight */
@property (nonatomic, readonly, assign) CGFloat cellHeight;

/** 卖价Frame */
@property (nonatomic, readonly , assign) CGRect priceLabelFrame;

/** 原价Frame */
@property (nonatomic, readonly , assign) CGRect oPriceLabelFrame;

/** 运费Frame */
@property (nonatomic, readonly , assign) CGRect freightageLabelFrame;

/// 初始化
- (instancetype)initWithGoods:(ICEGoods *)goods;



/// cell 上的事件处理
/// 用户头像被点击
@property (nonatomic, readwrite, strong) RACSubject *didClickedAvatarSubject;
/// 位置被点击
@property (nonatomic, readwrite, strong) RACSubject *didClickedLocationSubject;
/// 回复按钮被点击
@property (nonatomic, readwrite, strong) RACSubject *didClickedReplySubject;
///// 点赞被点击
@property (nonatomic, readwrite, strong) RACCommand *operationCommand;

@end
