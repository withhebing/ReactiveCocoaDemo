//
//  ICEBanner.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/15.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEModel.h"
#import "ICEGoodsImage.h"

/// 活动页跳转类型
typedef NS_ENUM(NSUInteger, ICEActivityPageSkipType) {
    ICEActivityPageSkipTypeWebPage = 0,       /// web
    ICEActivityPageSkipTypeNativePage = 1,    /// 原生
};


@interface ICEBanner : ICEModel

/// 服务器数据id 主键
@property (nonatomic, readwrite, copy)   NSString *primaryKey;
/// 跳转类型
@property (nonatomic, readwrite, assign) ICEActivityPageSkipType type;
/// 图片模型
@property (nonatomic, readwrite, strong) ICEGoodsImage  *image;
/// 标题
@property (nonatomic, readwrite, copy)   NSString *title;
/// 描述
@property (nonatomic, readwrite, copy)   NSString *desc;
/// 点击链接
@property (nonatomic, readwrite, copy)   NSString *url;
/// bannerId
@property (nonatomic, readwrite, copy)   NSString *bannerId;
/// 展示订单
@property (nonatomic, readwrite, copy)   NSString *displayOrder;
/// 开始时间
@property (nonatomic, readwrite, copy)   NSString *startDate;
/// 结束时间
@property (nonatomic, readwrite, copy)   NSString *endDate;
/// 创建时间
@property (nonatomic, readwrite, copy)   NSString *createdAt;
/// 创建用户
@property (nonatomic, readwrite, copy)   NSString *createdUser;
/// 更行时间
@property (nonatomic, readwrite, copy)   NSString *updatedAt;
/// 更新用户
@property (nonatomic, readwrite, copy)   NSString *updatedUser;

@end
