//
//  ICEGoodsImage.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/15.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEModel.h"

@interface ICEGoodsImage : ICEModel

// 图片ID
@property (nonatomic, readwrite, copy) NSString * imageId;
// 用户ID
@property (nonatomic, readwrite, copy) NSString * userId;
// 图片路径
@property (nonatomic, readwrite, copy) NSString * path;
// 图片地址
@property (nonatomic, readwrite, copy) NSString * url;

// 缩略图地址
@property (nonatomic, readwrite, copy) NSString * middle;
@property (nonatomic, readwrite, copy) NSString * small;

@end
