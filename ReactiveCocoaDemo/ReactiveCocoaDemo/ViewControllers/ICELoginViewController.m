//
//  ICELoginViewController.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/13.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICELoginViewController.h"
#import "UIBarButtonItem+ICEExtension.h"

@interface ICELoginViewController ()

@end

@implementation ICELoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self _setupNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -

- (void)_setupNavigation {
    UIBarButtonItem *backItem = [UIBarButtonItem ice_itemWithImageName:@"navigationButtonReturn" highImageName:@"navigationButtonReturnClick" target:self action:@selector(_backAction)];
    self.navigationItem.leftBarButtonItem = backItem;

    self.title = @"Login";

    UIBarButtonItem *fillItem = [[UIBarButtonItem alloc] initWithTitle:@"Fill" style:UIBarButtonItemStylePlain target:self action:@selector(_fillAction)];
    self.navigationItem.rightBarButtonItem = fillItem;
}

- (void)_backAction {
    NSLog(@"back");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)_fillAction {
    NSLog(@"fill");

}

- (void)_setupSubviews {

}

@end
