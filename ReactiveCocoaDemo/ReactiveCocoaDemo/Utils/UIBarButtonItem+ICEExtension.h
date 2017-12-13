//
//  UIBarButtonItem+ICEExtension.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/12.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  这个分类主要用来 快速创建一个UIBarButtonItem....
 */

@interface UIBarButtonItem (ICEExtension)

/**
 *  快速创建一个 UIBarButtonItem
 *
 *  @param imageName     普通状态下的图片
 *  @param highImageName 高亮状态下的图片
 *  @param target        目标
 *  @param action        操作
 *
 */
+ (UIBarButtonItem *)ice_itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)ice_itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;

@end
