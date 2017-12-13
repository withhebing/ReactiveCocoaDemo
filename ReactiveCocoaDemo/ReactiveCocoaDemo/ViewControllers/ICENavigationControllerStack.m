//
//  ICENavigationControllerStack.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/12.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICENavigationControllerStack.h"
#import "ICEViewController.h"
#import "ICEViewControllerAnimatedTransition.h"

@interface ICENavigationControllerStack () <UINavigationControllerDelegate>

@property (nonatomic, strong) id<ICEViewModelServices> services;
@property (nonatomic, strong) NSMutableArray *navigationControllers;

@end

@implementation ICENavigationControllerStack

- (instancetype)initWithServices:(id<ICEViewModelServices>)services {
    self = [super init];
    if (self) {
        self.services = services;
        self.navigationControllers = [[NSMutableArray alloc] init];
        [self registerNavigationHooks];
    }
    return self;
}

- (void)pushNavigationController:(UINavigationController *)navigationController {
    if ([self.navigationControllers containsObject:navigationController]) return;
    navigationController.delegate = self;
    [self.navigationControllers addObject:navigationController];
}

- (UINavigationController *)popNavigationController {
    UINavigationController *navigationController = self.navigationControllers.lastObject;
    [self.navigationControllers removeLastObject];
    return navigationController;
}

- (UINavigationController *)topNavigationController {
    return self.navigationControllers.lastObject;
}

- (void)registerNavigationHooks {
    ///
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(ICEViewControllerAnimatedTransition *)animationController {
    return animationController.fromViewController.interactivePopTransition;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(ICEViewController *)fromVC
                                                 toViewController:(ICEViewController *)toVC {
    if (fromVC.interactivePopTransition != nil) {
        return [[ICEViewControllerAnimatedTransition alloc] initWithNavigationControllerOperation:operation
                                                                               fromViewController:fromVC
                                                                                 toViewController:toVC];
    }
    return nil;
}

@end
