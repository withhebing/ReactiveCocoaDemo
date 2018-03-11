//
//  ICEGoods+ICEAttributedString.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/15.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEGoods.h"

@interface ICEGoods (ICEAttributedString)

/**
 * 商品价格的富文本
 */
- (NSMutableAttributedString *)ice_goodsPriceAttributedString;

/**
 * 商品原价格的富文本
 */
- (NSMutableAttributedString *)ice_goodsOPriceAttributedString;

/**
 * 全新+标题
 */
- (NSMutableAttributedString *)ice_goodsTitleAttributedString;

@end
