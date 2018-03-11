//
//  ICETableViewController.h
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/23.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEViewController.h"

@interface ICETableViewController : ICEViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong, readonly) UITableView *tableView;
@property (nonatomic, assign, readonly) UIEdgeInsets contentInset;

- (void)reloadData;
- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object;

/// 下拉刷新事件
- (void)tableViewDidTriggerHeaderRefresh;
/// 上拉加载事件
- (void)tableViewDidTriggerFooterRefresh;
/// 刷新事件完成; isHeader: 是否是下拉刷新结束; shouldReload: 是否需要刷新数据
- (void)tableViewDidFinishTriggerHeader:(BOOL)isHeader shouldReload:(BOOL)shouldReload;

@end
