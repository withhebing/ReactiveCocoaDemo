//
//  NSAttributedString+ICESize.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/21.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "NSAttributedString+ICESize.h"

@implementation NSAttributedString (ICESize)

- (CGSize)ice_sizeWithLimitedWidth:(CGFloat)limitedWidth {
    return [self ice_sizeWithLimitedSize:CGSizeMake(limitedWidth, CGFLOAT_MAX)];
}

- (CGSize)ice_sizeWithLimitedSize:(CGSize)limitedSize {
    CGSize size = CGSizeZero;
    CGRect rect = [self boundingRectWithSize:limitedSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    size.width = ceil(rect.size.width);
    size.height = ceil(rect.size.height);
    return size;
}

@end
