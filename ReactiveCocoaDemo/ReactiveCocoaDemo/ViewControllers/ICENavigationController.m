//
//  ICENavigationController.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/12.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICENavigationController.h"
#import "UIBarButtonItem+ICEExtension.h"

@interface ICENavigationController ()

@end

@implementation ICENavigationController

+ (void)initialize {
    [self _setupNavigationBarTheme];
    [self _setupBarButtonItemTheme];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -

+ (void)_setupNavigationBarTheme {
    UINavigationBar *appearance = [UINavigationBar appearance];
    // 透明
    appearance.translucent = YES;
    // 样式
    appearance.barStyle = UIBarStyleDefault;
    // 渲染色
    appearance.tintColor = [UIColor whiteColor];
    // 背景色
    appearance.barTintColor = [UIColor whiteColor];
    // 背景图片
    [appearance setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];

    // 文字属性
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeZero;
    NSDictionary *textAttrs = @{
                                NSFontAttributeName : [UIFont systemFontOfSize:14],
                                NSForegroundColorAttributeName : [UIColor blackColor],
                                NSShadowAttributeName : shadow
                                };
    appearance.titleTextAttributes = textAttrs;
}

+ (void)_setupBarButtonItemTheme {
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];

    // 普通状态文字属性
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeZero;
    NSDictionary *textAttrs = @{
                                NSFontAttributeName : [UIFont systemFontOfSize:14],
                                NSForegroundColorAttributeName : [UIColor blackColor],
                                NSShadowAttributeName : shadow
                                };
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];

    // 高亮状态
    NSDictionary *highlightedTextAttrs = @{
                                NSFontAttributeName : [UIFont systemFontOfSize:14],
                                NSForegroundColorAttributeName : [UIColor blackColor],
                                };
    [appearance setTitleTextAttributes:highlightedTextAttrs forState:UIControlStateHighlighted];

    // 不可用状态
    NSDictionary *disabledTextAttrs = @{
                                         NSFontAttributeName : [UIFont systemFontOfSize:14],
                                         NSForegroundColorAttributeName : [UIColor blackColor],
                                         };
    [appearance setTitleTextAttributes:disabledTextAttrs forState:UIControlStateDisabled];

    // 背景图片 (技巧: 为了让某个按钮的背景消失, 可以设置一张完全透明的背景图片)
//    [appearance setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

#pragma mark - push

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;

        UIBarButtonItem *backItem = [UIBarButtonItem ice_itemWithImageName:@"navigationButtonReturn" highImageName:@"navigationButtonReturnClick" target:self action:@selector(_backAction)];
        viewController.navigationItem.leftBarButtonItem = backItem;
    }

    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }

    [super pushViewController:viewController animated:animated];
}

- (void)_backAction {
    [self popViewControllerAnimated:YES];
}

#pragma mark -

- (BOOL)shouldAutorotate {
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.topViewController.supportedInterfaceOrientations;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.topViewController.preferredStatusBarStyle;
}

@end
