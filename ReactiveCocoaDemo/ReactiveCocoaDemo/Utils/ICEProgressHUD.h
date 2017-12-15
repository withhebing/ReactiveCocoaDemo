//
//  ICEProgressHUD.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/14.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface ICEProgressHUD : MBProgressHUD

/// Added to window
/// 提示信息
+ (ICEProgressHUD *)ice_showMessage:(NSString *)msgStr;

/// 提示错误
+ (ICEProgressHUD *)ice_showError:(NSError *)error;

/// 进度HUD
+ (ICEProgressHUD *)ice_showProgressHUD:(NSString *)titleStr;

/// 隐藏HUD
+ (void)ice_hideHUD;


/// Added to certain view
/// 提示信息
+ (ICEProgressHUD *)ice_showMessage:(NSString *)msgStr addedToView:(UIView *)view;

/// 提示错误
+ (ICEProgressHUD *)ice_showError:(NSError *)error addedToView:(UIView *)view;

/// 进度HUD
+ (ICEProgressHUD *)ice_showProgressHUD:(NSString *)titleStr addedToView:(UIView *)view;

/// 隐藏HUD
+ (void)ice_hideHUDForView:(UIView *)view;

@end
