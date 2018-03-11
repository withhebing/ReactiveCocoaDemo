//
//  ICEGoodsViewController.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/13.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICEGoodsViewController.h"
#import "ICESearchViewModel.h"  // test

@interface ICEGoodsViewController ()

// test
@property (nonatomic, strong) UITextField *searchFld;
@property (nonatomic, strong, readonly) ICESearchViewModel *searchViewModel;

@end

@implementation ICEGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    if (@available(iOS 11.0, *)) {
        // Adaptation Processing
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)_testSearchProcessing {
    // 需求：用户在searchBar中输入文本，当停止输入超过0.3秒，认为seachBar中的内容为用户的意向搜索关键字searchKey，将searchKey作为参数执行搜索操作。搜索内容可能是多样的，也许包括搜单聊消息、群聊消息、公众号消息、联系人等，而这些信息搜索的方式也有不同，有些从本地获取，有些是去服务器查询，因此返回的速度快慢不一。我们不能等到数据全部获取成功时才显示搜索结果页面，而应该只要有部分数据返回时就将其抛到主线程渲染显示。

    // 分析：在这个需求中，从数据输入到最后搜索数据的显示可以具象成一条数据流，数据流中各处对于数据的操作都可以使用上面提到的RAC Operation来完成。

    [[[self.searchFld rac_textSignal]
      throttle:0.3]
     subscribeNext:^(NSString *keyStr) {
         RACSignal *searchSignal = [self.searchViewModel createSearchSignalWithString:keyStr];

         [[[searchSignal
            scanWithStart:[NSMutableArray array] reduce:^NSMutableArray *(NSMutableArray *running, NSArray *next) {
                [running addObjectsFromArray:next];
                return running;
            }]
           deliverOnMainThread]
          subscribeNext:^(id  _Nullable x) {
              // UI Processing
          }];
     }];

    // 结论：使用RAC构建数据流后，声明式的代码显得优雅且清晰易读，看似复杂的业务需求在RAC的组织下，一两句代码就得以轻松搞定。反观，如果使用常规方法，估计一个throttle对应的操作就会让逻辑代码散落各处，另一个scanWithStart的对应操作也应该会加入不少中间变量，这些无疑都会大大提升了代码的维护成本。数据流的设计也会让编码者感觉自己更像是代码的设计者，而并非代码的搬运工，让人乐此不疲^_^。

    // 总结：事实上，RAC提供了非常丰富的操作，通过这些操作的组合，我们基本可以处理日常的业务逻辑。当然，需求是多样且奇特的，或许在特定情况下无法找到现成的RAC Operation，因此如果有需要，我们也可以直接拓展RACSignal操作或添加自定义UIKit的RAC拓展，从而让我们的代码 "more functional, more elegant”。可以毫不夸张的说，阻碍RAC发挥的瓶颈只有想象力，当我们接到需求后，仔细推敲数据的走向并设计好相关数据的操作，只要RAC数据流图绘制出来，剩下的代码工作也就信手拈来。

    // RAC
}

@end
