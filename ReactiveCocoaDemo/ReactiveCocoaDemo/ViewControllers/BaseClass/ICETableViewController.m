//
//  ICETableViewController.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/23.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICETableViewController.h"
#import "ICETableViewModel.h"
#import <YYText/YYText.h>

@interface ICETableViewController ()

@property (nonatomic, strong, readwrite) UISearchBar *searchBar;
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong) YYLabel *fpsLabel;    // YYFPSLabel
@property (nonatomic, assign, readwrite) UIEdgeInsets contentInset;    // default is (64, 0, 0, 0)
@property (nonatomic, strong, readonly) ICETableViewModel *viewModel;

@end

@implementation ICETableViewController

@dynamic viewModel;

- (instancetype)initWithViewModel:(ICEViewModel *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        if ([viewModel shouldRequestRemoteDataOnViewDidLoad]) {
            @weakify(self);
            [[self rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(RACTuple * _Nullable x) {
                @strongify(self);
                [self.viewModel.requestRemoteDataCommand execute:@1];
            }];
        }
    }
    return self;
}

- (UIEdgeInsets)contentInset {
    return UIEdgeInsetsMake(64, 0, 0, 0);
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)bindViewModel {
    [super bindViewModel];

    @weakify(self);
    [[[RACObserve(self.viewModel, dataSource)
       distinctUntilChanged]
      deliverOnMainThread]
     subscribeNext:^(id  _Nullable x) {
         @strongify(self);
         [self reloadData];
     }];

//    [self.viewModel.requestRemoteDataCommand.executing subscribeNext:^(NSNumber *executing) {
//        @strongify(self);
//        UIView *emptyDataSetView = [self.tableView.subviews.rac_sequence objectPassingTest:^BOOL(__kindof UIView *view) {
//            return [NSStringFromClass(view.class) isEqualToString:@""]; ///
//        }];
//        emptyDataSetView.alpha = 1.0 - executing.floatValue;
//    }];
}

- (void)reloadData {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    _tableView.dataSource = nil;
    _tableView.delegate = nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object {

}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.dataSource ? self.viewModel.dataSource.count : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.dataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self tableView:tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
    id object = self.viewModel.dataSource[indexPath.section][indexPath.row];
    [self configureCell:cell atIndexPath:indexPath withObject:(id)object];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section >= self.viewModel.sectionIndexTitles.count) {
        return nil;
    }
    return self.viewModel.sectionIndexTitles[section];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    if (self.searchBar != nil) {
        if (self.viewModel.sectionIndexTitles.count != 0) {
            return [self.viewModel.sectionIndexTitles.rac_sequence startWith:UITableViewIndexSearch].array;
        }
    }
    return self.viewModel.sectionIndexTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    if (self.searchBar != nil) {
        if (index == 0) {
            [tableView scrollRectToVisible:self.searchBar.frame animated:NO];
        }
        return index - 1;
    }
    return index;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.viewModel.didSelectCommand execute:indexPath];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.fpsLabel.alpha == 0) {
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.fpsLabel.alpha = 1;
        } completion:nil];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        if (self.fpsLabel.alpha != 0) {
            [UIView animateWithDuration:1.0 delay:2.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.fpsLabel.alpha = 0;
            } completion:nil];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.fpsLabel.alpha != 0) {
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.fpsLabel.alpha = 1;
        } completion:nil];
    }
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    if (self.fpsLabel.alpha == 0) {
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.fpsLabel.alpha = 1;
        } completion:nil];
    }
}

@end
