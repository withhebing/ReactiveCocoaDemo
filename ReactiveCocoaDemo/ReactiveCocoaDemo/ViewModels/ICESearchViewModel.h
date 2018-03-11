//
//  ICESearchViewModel.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/19.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEViewModel.h"

@interface ICESearchViewModel : ICEViewModel

- (RACSignal *)createSearchSignalWithString:(NSString *)keyword;

@end
