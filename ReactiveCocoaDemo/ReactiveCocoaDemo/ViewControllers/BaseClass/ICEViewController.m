//
//  ICEViewController.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/12.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEViewController.h"

@interface ICEViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong, readwrite) ICEViewModel *viewModel;
@property (nonatomic, strong, readwrite) UIPercentDrivenInteractiveTransition *interactivePopTransition;

@end

@implementation ICEViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    ICEViewController *viewController = [super allocWithZone:zone];
    @weakify(viewController)
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(RACTuple * _Nullable x) {
        @strongify(viewController);
        [viewController bindViewModel];
    }];
    return viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];

#ifdef __IPHONE_11_0
    self.automaticallyAdjustsScrollViewInsets = YES;
#else
    self.automaticallyAdjustsScrollViewInsets = NO;
#endif

    self.extendedLayoutIncludesOpaqueBars = YES;

    self.view.backgroundColor = ICEGlobalGrayBackgroundColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -

- (instancetype)initWithViewModel:(ICEViewModel *)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)bindViewModel {
    RAC(self, title) = RACObserve(self, viewModel.title);
    [self.viewModel.errors subscribeNext:^(NSError *error) {
        NSLog(@"viewModel error -- %@", error);
    }];
}

#pragma mark - Orientation

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

#pragma mark - Status bar

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationFade;
}

@end
