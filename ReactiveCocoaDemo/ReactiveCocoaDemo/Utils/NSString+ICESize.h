//
//  NSString+ICESize.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/21.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ICESize)

- (CGSize)ice_sizeWithFont:(UIFont *)font;

- (CGSize)ice_sizeWithFont:(UIFont *)font limitedWidth:(CGFloat)limitedWidth;

- (CGSize)ice_sizeWithFont:(UIFont *)font limitedSize:(CGSize)limitedSize;

@end
