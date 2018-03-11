//
//  NSAttributedString+ICESize.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/21.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (ICESize)

/// 动态计算文字尺寸 (多行)

// 限制宽度
- (CGSize)ice_sizeWithLimitedWidth:(CGFloat)limitedWidth;
// 限制尺寸范围
- (CGSize)ice_sizeWithLimitedSize:(CGSize)limitedSize;

@end
