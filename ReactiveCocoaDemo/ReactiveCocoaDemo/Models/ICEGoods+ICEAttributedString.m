//
//  ICEGoods+ICEAttributedString.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/15.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEGoods+ICEAttributedString.h"

@implementation ICEGoods (ICEAttributedString)

/**
 * 商品价格的富文本
 */
- (NSMutableAttributedString *)ice_goodsPriceAttributedString{

    if(!ICEStringIsNotEmpty(self.price)) return nil;

    if (self.price.floatValue<=.000001f) return nil;

    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"￥%@", self.price]];

    /// 设置所有字符串的富文本
    [attrString setAttributes:@{NSForegroundColorAttributeName:ICEGlobalLightRedColor,
                                NSFontAttributeName:ICEMediumFont(22.0f)
                                } range:NSMakeRange(0, attrString.string.length)];
    // 设置第一个￥的字体大小
    NSRange rmbRange = NSMakeRange(0, 1);
    [attrString yy_setFont:ICEMediumFont(14.0f) range:rmbRange];
    [attrString yy_setColor:ICEGlobalLightRedColor range:rmbRange];

    return attrString.copy;
}

/**
 * 商品原价格的富文本
 */
- (NSMutableAttributedString *)ice_goodsOPriceAttributedString{
    if(ICEStringIsNotEmpty(self.oPrice) && self.oPrice.floatValue>.0000001)
    {
        NSMutableAttributedString *oPriceAttr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"原价%@",self.oPrice]];
        oPriceAttr.yy_font = ICERegularFont(12.f);
        oPriceAttr.yy_color = ICEGlobalShadowGrayTextColor;
        return oPriceAttr.copy;
    }
    return nil;
}

/**
 * 全新+标题
 */
- (NSMutableAttributedString *)ice_goodsTitleAttributedString{
    // 是否全新
    NSString *goodsTitle = [self valueForKeyPath:@"title"];
    if (!ICEStringIsNotEmpty(goodsTitle) && !self.isBrandNew) return nil;

    NSString *tempStr = (self.isBrandNew)?[NSString stringWithFormat:@" %@",goodsTitle]:goodsTitle;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:tempStr];
    attr.yy_font = ICEMediumFont(15.0f);
    attr.yy_color = ICEGlobalShadowBlackTextColor;

    if (self.isBrandNew) {
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:@"su_goods_home_new"];
        attach.bounds = CGRectMake(0, -2.5, attach.image.size.width, attach.image.size.height);
        NSAttributedString *imageAttr = [NSAttributedString attributedStringWithAttachment:attach];
        [attr insertAttributedString:imageAttr atIndex:0];
        return attr;
    }
    return attr;
}

@end
