//
//  NSString+ICESize.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/21.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "NSString+ICESize.h"

@implementation NSString (ICESize)

- (CGSize)ice_sizeWithFont:(UIFont *)font {
    CGSize size = [self sizeWithAttributes:@{
                                             NSFontAttributeName : font
                                             }];
    // 向上取整
    size.width = ceil(size.width);
    size.height = ceil(size.height);
    return size;
}

- (CGSize)ice_sizeWithFont:(UIFont *)font limitedWidth:(CGFloat)limitedWidth {
    return [self ice_sizeWithFont:font limitedSize:CGSizeMake(limitedWidth, CGFLOAT_MAX)];
}

- (CGSize)ice_sizeWithFont:(UIFont *)font limitedSize:(CGSize)limitedSize {
    CGSize size = [self boundingRectWithSize:limitedSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : font} context:nil].size;
    size.width = ceil(size.width);
    size.height = ceil(size.height);
    return size;
}

@end
