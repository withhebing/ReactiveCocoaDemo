//
//  ICEProgressHUD.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/14.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEProgressHUD.h"

@implementation ICEProgressHUD

#pragma mark - Added to window

+ (ICEProgressHUD *)ice_showMessage:(NSString *)msgStr {
    return [self ice_showMessage:msgStr addedToView:nil];
}

+ (ICEProgressHUD *)ice_showError:(NSError *)error {
    return [self ice_showError:error addedToView:nil];
}

+ (ICEProgressHUD *)ice_showProgressHUD:(NSString *)titleStr {
    return [self ice_showProgressHUD:titleStr addedToView:nil];
}

+ (void)ice_hideHUD {
    [self ice_hideHUDForView:nil];
}

#pragma mark - Added to certain view

+ (ICEProgressHUD *)ice_showMessage:(NSString *)msgStr addedToView:(UIView *)view {
    return [self _showHUDWithMessage:msgStr isAutomaticHide:YES addedToView:view];
}

+ (ICEProgressHUD *)ice_showError:(NSError *)error addedToView:(UIView *)view {
    return [self _showHUDWithMessage:[NSError ice_messageFromError:error] isAutomaticHide:YES addedToView:view];
}

+ (ICEProgressHUD *)ice_showProgressHUD:(NSString *)titleStr addedToView:(UIView *)view {
    return [self _showHUDWithMessage:titleStr isAutomaticHide:NO addedToView:view];
}

+ (void)ice_hideHUDForView:(UIView *)view {
    [self hideHUDForView:[self _willShowingToViewWithSourceView:view] animated:YES];
}

#pragma mark - 私有辅助方法

// 获取将要显示的view
+ (UIView *)_willShowingToViewWithSourceView:(UIView *)sourceView {
    if (sourceView) return sourceView;

    sourceView =  [[UIApplication sharedApplication].delegate window];
    if (!sourceView) sourceView = [[[UIApplication sharedApplication] windows] lastObject];

    return sourceView;
}

+ (instancetype)_showHUDWithMessage:(NSString *)message isAutomaticHide:(BOOL)isAutomaticHide addedToView:(UIView *)view {
    view = [self _willShowingToViewWithSourceView:view];

    /// 也可以show之前, hide掉之前的
    [self ice_hideHUDForView:view];

    ICEProgressHUD *HUD = [ICEProgressHUD showHUDAddedTo:view animated:YES];
    HUD.mode = isAutomaticHide?MBProgressHUDModeText:MBProgressHUDModeIndeterminate;
    HUD.animationType = MBProgressHUDAnimationZoom;
    HUD.label.font = ICEMediumFont(17.f);
    HUD.label.textColor = [UIColor whiteColor];
    HUD.contentColor = [UIColor whiteColor];
    HUD.label.text = message;
    HUD.bezelView.layer.cornerRadius = 8.0f;
    HUD.bezelView.layer.masksToBounds = YES;
    HUD.bezelView.color = RGBAlpha(0, 0, 0, .6f);
    HUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    HUD.minSize =isAutomaticHide?CGSizeMake([UIScreen mainScreen].bounds.size.width-96.0f, 60):CGSizeZero;
    HUD.margin = 18.2f;
    HUD.removeFromSuperViewOnHide = YES;
    if (isAutomaticHide) [HUD hideAnimated:YES afterDelay:1.0f];

    return HUD;
}

@end
