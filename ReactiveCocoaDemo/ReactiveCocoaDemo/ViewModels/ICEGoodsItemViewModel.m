//
//  ICEGoodsItemViewModel.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/15.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEGoodsItemViewModel.h"
#import "ICEGoods+ICEAttributedString.h"

@interface ICEGoodsItemViewModel ()

/// 商品模型
@property (nonatomic, readwrite, strong) ICEGoods *goods;

//// ------ 商品模型属性 -----

/// 商品数量
@property (nonatomic, readwrite, copy) NSString *number;

/// 商品图片UrlString
@property (nonatomic, readwrite, copy) NSArray <NSString *> *imagesUrlStrings;
/// 运费情况
@property (nonatomic, readwrite, copy) NSString *freightExplain;

/// 发布时间描述
@property (nonatomic, readwrite, copy) NSString *goodsPublishTime;

/// 商品价格的富文本
@property (nonatomic, readwrite, copy) NSAttributedString *goodsPriceAttributedString;

/// 商品原价的富文本
@property (nonatomic, readwrite, copy) NSAttributedString *goodsOPriceAttributedString;

/// 全新+title
@property (nonatomic, readwrite, copy) NSAttributedString *goodsTitleAttributedString;


//// ------ 商品尺寸属性 -----
/** cellHeight */
@property (nonatomic, readwrite, assign) CGFloat cellHeight;

/** 卖价Frame */
@property (nonatomic, readwrite , assign) CGRect priceLabelFrame;

/** 原价Frame */
@property (nonatomic, readwrite , assign) CGRect oPriceLabelFrame;

/** 运费Frame */
@property (nonatomic, readwrite , assign) CGRect freightageLabelFrame;

@end


@implementation ICEGoodsItemViewModel

- (instancetype)initWithGoods:(ICEGoods *)goods {
    self = [super init];
    if (self) {
        self.goods = goods;

        // 商品数量
        self.number = [NSString stringWithFormat:@"数量 %@", goods.number];

        // 邮费情况
        NSString *freightExplain = nil;
        ICEGoodsExpressType expressType = goods.expressType;
        if (expressType == ICEGoodsExpressTypeFree) {
            // 包邮
            freightExplain = @"包邮";
        } else if (expressType == ICEGoodsExpressTypeValue) {
            // 运费
            NSString *extraFee = [NSString stringWithFormat:@"运费 ¥%@", goods.expressFee];
            freightExplain = extraFee;
        } else if (expressType == ICEGoodsExpressTypeFeeding) {
            // 待议
            freightExplain = @"运费待议";
        }
        self.freightExplain = freightExplain;

        // 卖价
        self.goodsPriceAttributedString = [goods ice_goodsPriceAttributedString];

        // 原价
        self.goodsOPriceAttributedString = [goods ice_goodsOPriceAttributedString];

        // titleAttr
        self.goodsTitleAttributedString = [goods ice_goodsTitleAttributedString];

        // 发布时间
        self.goodsPublishTime = [goods.editAt ice_string_yyyy_MM_dd];

        // 商品图片
        self.imagesUrlStrings = [self imageURLs];

        // 计算尺寸
        CGFloat priceViewH = 38.f;
        // 卖价尺寸
        CGSize priceLabelSize = [self.goodsPriceAttributedString ice_sizeWithLimitedWidth:SCREEN_WIDTH];
        CGFloat priceLabelX = ICEGlobalViewLeftOrRightMargin;
        CGFloat priceLabelY = (priceViewH - priceLabelSize.height);
        self.priceLabelFrame = (CGRect){{priceLabelX, priceLabelY}, priceLabelSize};
        // 运费
        CGFloat freightExplainX = CGRectGetMaxX(self.priceLabelFrame) + ICEGlobalViewInnerMargin;
        CGSize freightExplainSize = [self.freightExplain ice_sizeWithFont:ICERegularFont(12.f)];
        CGFloat freightExplainY = (priceViewH - 4 - freightExplainSize.height - 6);

        // 默认尺寸
        self.oPriceLabelFrame = CGRectZero;
        if (ICEStringIsNotEmpty(self.goodsOPriceAttributedString.string)) {
            // 原价
            CGFloat oPriceX = CGRectGetMaxX(self.priceLabelFrame) + 5.f;
            CGSize oPriceSize = [self.goodsOPriceAttributedString ice_sizeWithLimitedWidth:(SCREEN_WIDTH - ICEGlobalViewInnerMargin - oPriceX)];
            CGFloat oPriceY = (priceViewH - 4 - oPriceSize.height);
            self.oPriceLabelFrame = (CGRect){{oPriceX, oPriceY}, oPriceSize};
            // 运费
            freightExplainX = CGRectGetMaxX(self.oPriceLabelFrame) + ICEGlobalViewInnerMargin;
        }
        // 运费尺寸
        self.freightageLabelFrame = (CGRect){{freightExplainX, freightExplainY}, {freightExplainSize.width + 16, freightExplainSize.height + 6}};

        // 计算描述的高度
        CGFloat limitedWidth = SCREEN_WIDTH - 2*ICEGlobalViewLeftOrRightMargin;
        // 字体的行高
        CGFloat lineHeight = ceil(ICERegularFont(14.f).lineHeight);
        CGFloat descHeight = ([goods.goodsDescription ice_sizeWithFont:ICERegularFont(14.f) limitedWidth:limitedWidth].height > lineHeight) ? 2*lineHeight : lineHeight;

        // cellHeight (+2容错)
        self.cellHeight = 55+88+38+33+34+14+descHeight+2;
    }

    return self;
}

- (NSArray<NSString *> *)imageURLs {
    NSMutableArray *urlStrings = [NSMutableArray array];
    [self.goods.images enumerateObjectsUsingBlock:^(ICEGoodsImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.url) {
            [urlStrings addObject:obj.url];
        }
    }];
    return urlStrings.copy;
}

@end
