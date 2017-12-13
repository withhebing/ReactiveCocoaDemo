//
//  ICEViewControllerAnimatedTransition.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/12.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICEViewController.h"

@interface ICEViewControllerAnimatedTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, readonly) UINavigationControllerOperation operation;
@property (nonatomic, weak, readonly) ICEViewController *fromViewController;
@property (nonatomic, weak, readonly) ICEViewController *toViewController;

- (instancetype)initWithNavigationControllerOperation:(UINavigationControllerOperation)operation
                                   fromViewController:(ICEViewController *)fromViewController
                                     toViewController:(ICEViewController *)toViewController;

@end
