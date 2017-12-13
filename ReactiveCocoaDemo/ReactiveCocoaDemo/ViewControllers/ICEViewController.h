//
//  ICEViewController.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/12.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICEViewModel.h"

@interface ICEViewController : UIViewController

@property (nonatomic, strong, readonly) ICEViewModel *viewModel;
@property (nonatomic, strong, readonly) UIPercentDrivenInteractiveTransition *interactivePopTransition;
@property (nonatomic, strong) UIView *snapshot;

/// Initialization method. This is the preferred way to create a new view.
///
/// viewModel - corresponding view model
///
/// Returns a new view.
- (instancetype)initWithViewModel:(ICEViewModel *)viewModel;

/// Binds the corresponding view model to the view.
- (void)bindViewModel;

@end
