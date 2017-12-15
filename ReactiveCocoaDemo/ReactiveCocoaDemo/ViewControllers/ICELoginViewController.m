//
//  ICELoginViewController.m
//  ReactiveCocoaDemo
//
//  Created by Beans on 2017/12/13.
//  Copyright © 2017年 iceWorks. All rights reserved.
//

#import "ICELoginViewController.h"
#import "UIBarButtonItem+ICEExtension.h"
#import "ICEGoodsViewController.h"

@interface ICELoginViewController ()

@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UIView *inputBaseView;
@property (nonatomic, strong) UITextField *mobileFld;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UITextField *verifyFld;
@property (nonatomic, strong) UIButton *loginBtn;

@property (nonatomic, strong, readonly) ICELoginViewModel *viewModel;

@end

@implementation ICELoginViewController

@dynamic viewModel;
//@synthesize viewModel = _viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];

    [self _setupNavigation];
    [self _setupSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    ICELogDealloc;
}

- (void)bindViewModel {
    [super bindViewModel];

    @weakify(self);

    // 绑定头像数据
    [RACObserve(self.viewModel, avatarUrlStr) subscribeNext:^(NSString *avatarUrlStr) {
        @strongify(self);
        [self.avatarView sd_setImageWithURL:[NSURL URLWithString:avatarUrlStr] placeholderImage:kPlaceholderUserIcon()];
    }];

    /*
    /// Fixed：rac_textSignal只有用户输入才有效，如果只是直接赋值 eg:self.inputView.phoneTextField.text = @"xxxx"  这样self.inputView.phoneTextField.rac_textSignal就不会触发的。
    /// 解决办法：利用 RACObserve 来观察self.inputView.phoneTextField.text的赋值办法即可
    /// 用户输入的情况 触发rac_textSignal
    /// 用户非输入而是直接赋值的情况 触发RACObserve

    RAC(self.viewModel , mobilePhone) = self.inputView.phoneTextField.rac_textSignal;
    RAC(self.viewModel , verifyCode) = self.inputView.verifyTextField.rac_textSignal;
     */
    RAC(self.viewModel, mobilePhone) = [RACSignal merge:@[RACObserve(self.mobileFld, text), self.mobileFld.rac_textSignal]];
    RAC(self.viewModel, verifyCode) = [RACSignal merge:@[RACObserve(self.verifyFld, text), self.verifyFld.rac_textSignal]];

    RAC(self.loginBtn, enabled) = self.viewModel.validLoginSignal;

    /*
    切记：如果这样写会崩溃：原因是 一个对象只能绑定一个RACDynamicSignal的信号
    RAC(self.loginBtn , enabled) = self.viewModel.validLoginSignal;
    self.loginBtn.rac_command = self.viewModel.loginCommand;
    reason：'Signal <RACDynamicSignal: 0x60800023d3e0> name:  is already bound to key path "enabled" on object <UIButton: 0x7f8448c57690; frame = (12 362; 351 49); opaque = NO; autoresize = RM+BM; layer = <CALayer: 0x60800023dae0>>, adding signal <RACReplaySubject: 0x60000027ce00> name:  is undefined behavior'
     */
    // 点击登录按钮
    [[[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
      doNext:^(__kindof UIControl * _Nullable x) {
          @strongify(self);
          [self.view endEditing:YES];
          [ICEProgressHUD ice_showProgressHUD:@"Loading..."];
//          [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
      }]
     subscribeNext:^(UIButton *sender) {
         @strongify(self);
         [self.viewModel.loginCommand execute:@1];
     }];

    //
    [self.viewModel.loginCommand.executionSignals.switchToLatest
     subscribeNext:^(id  _Nullable x) {
         NSLog(@"login command, switch to latest, subscribe next");
         @strongify(self);
         [ICEProgressHUD ice_hideHUD];
//         [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
         // 跳转 (此处暂时直接创建VC, ViewModel-Based Navigation 正在学习中)
         ICEGoodsViewModel *goodsViewModel = [[ICEGoodsViewModel alloc] init];
         ICEGoodsViewController *goodsViewController = [[ICEGoodsViewController alloc] initWithViewModel:goodsViewModel];
         [self.navigationController pushViewController:goodsViewController animated:YES];
     }];

    // 错误信息
    [self.viewModel.loginCommand.errors subscribeNext:^(NSError * _Nullable error) {
        if ([error.domain isEqualToString:ICECommandErrorUserInfoKey]) {
            [ICEProgressHUD ice_showMessage:error.userInfo[ICECommandErrorUserInfoKey]];
            return;
        }
        [ICEProgressHUD ice_showError:error];
    }];
}

#pragma mark -

- (void)_setupNavigation {
//    UIBarButtonItem *backItem = [UIBarButtonItem ice_itemWithImageName:@"navigationButtonReturn" highImageName:@"navigationButtonReturnClick" target:self action:@selector(_backAction)];
    UIBarButtonItem *backItem = [UIBarButtonItem ice_itemWithImageName:@"navigationButtonReturn" highImageName:@"navigationButtonReturnClick" target:nil action:NULL];
    self.navigationItem.leftBarButtonItem = backItem;

//    self.title = @"Login";

//    UIBarButtonItem *fillItem = [[UIBarButtonItem alloc] initWithTitle:@"Fill" style:UIBarButtonItemStylePlain target:self action:@selector(_fillAction)];
    UIBarButtonItem *fillItem = [[UIBarButtonItem alloc] initWithTitle:@"Fill" style:UIBarButtonItemStylePlain target:nil action:NULL];
    self.navigationItem.rightBarButtonItem = fillItem;

    @weakify(self);
    ((UIButton *)self.navigationItem.leftBarButtonItem.customView).rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        NSLog(@"rac back, custom view");
        [self.navigationController popViewControllerAnimated:YES];
        return [RACSignal empty];
    }];
    self.navigationItem.rightBarButtonItem.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        NSLog(@"rac fill");
        self.mobileFld.text = @"13912341234";   // 模拟数据
        self.verifyFld.text = @"1234";
        return [RACSignal empty];
    }];
}

- (void)_backAction {
    NSLog(@"back");
}

- (void)_fillAction {
    NSLog(@"fill");
}

- (void)_setupSubviews {
    [self.view addSubview:self.avatarView];
    [self.view addSubview:self.inputBaseView];
    [self.view addSubview:self.mobileFld];
    [self.view addSubview:self.lineView];
    [self.view addSubview:self.verifyFld];
    [self.view addSubview:self.loginBtn];

    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(64+20);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [self.mobileFld mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.avatarView.mas_bottom).offset(50);
        make.height.equalTo(@50);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mobileFld).offset(15);
        make.right.equalTo(self.mobileFld).offset(-15);
        make.top.equalTo(self.mobileFld.mas_bottom);
        make.height.equalTo(@0.5);
    }];
    [self.verifyFld mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.mobileFld);
        make.top.equalTo(self.lineView.mas_bottom);
        make.height.equalTo(self.mobileFld);
    }];
    [self.inputBaseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.mobileFld);
        make.top.equalTo(self.mobileFld);
        make.bottom.equalTo(self.verifyFld);
    }];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.top.equalTo(self.verifyFld.mas_bottom).offset(40);
        make.height.equalTo(@40);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - Lazy load

- (UIImageView *)avatarView {
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc] init];
        _avatarView.contentMode = UIViewContentModeScaleAspectFit;
        _avatarView.image = [UIImage imageNamed:@"mh_defaultAvatar"];
    }
    return _avatarView;
}

- (UIView *)inputBaseView {
    if (!_inputBaseView) {
        _inputBaseView = [[UIView alloc] init];
        _inputBaseView.backgroundColor = [UIColor whiteColor];
    }
    return _inputBaseView;
}

- (UITextField *)mobileFld {
    if (!_mobileFld) {
        UITextField *mobileFld = [[UITextField alloc] init];
        mobileFld.backgroundColor = [UIColor whiteColor];
        mobileFld.clearButtonMode = UITextFieldViewModeWhileEditing;
        mobileFld.font = ICEPingFangSCRegularFont(14.f);
        mobileFld.textColor = ICEGlobalShadowBlackTextColor;
        mobileFld.textAlignment = NSTextAlignmentLeft;
        mobileFld.text = [[NSUserDefaults standardUserDefaults] objectForKey:ICELoginPhoneKey];
        mobileFld.placeholder = @"请输入手机号码";
        mobileFld.borderStyle = UITextBorderStyleNone;
        mobileFld.keyboardType = UIKeyboardTypeNumberPad;
        mobileFld.returnKeyType = UIReturnKeyDone;
        mobileFld.enabled = YES;

        UILabel *mobileLbl = [[UILabel alloc] init];
        mobileLbl.bounds = CGRectMake(0, 0, 60, 30);
        mobileLbl.font = ICEPingFangSCRegularFont(14.f);
        mobileLbl.text = @"手机号";
        mobileLbl.textColor = ICEGlobalShadowBlackTextColor;
        mobileLbl.textAlignment = NSTextAlignmentCenter;

        mobileFld.leftView = mobileLbl;
        mobileFld.leftViewMode = UITextFieldViewModeAlways;

        _mobileFld = mobileFld;
    }
    return _mobileFld;
}

- (UITextField *)verifyFld {
    if (!_verifyFld) {
        UITextField *verifyFld = [[UITextField alloc] init];
        verifyFld.backgroundColor = [UIColor whiteColor];
        verifyFld.clearButtonMode = UITextFieldViewModeWhileEditing;
        verifyFld.font = ICEPingFangSCRegularFont(14.f);
        verifyFld.textColor = ICEGlobalShadowBlackTextColor;
        verifyFld.textAlignment = NSTextAlignmentLeft;
        verifyFld.text = [[NSUserDefaults standardUserDefaults] objectForKey:ICELoginVerifyCodeKey];
        verifyFld.placeholder = @"请输入验证码";
        verifyFld.borderStyle = UITextBorderStyleNone;
        verifyFld.keyboardType = UIKeyboardTypeNumberPad;
        verifyFld.returnKeyType = UIReturnKeyDone;
        verifyFld.enabled = YES;

        UILabel *verifyLbl = [[UILabel alloc] init];
        verifyLbl.bounds = CGRectMake(0, 0, 60, 30);
        verifyLbl.font = ICEPingFangSCRegularFont(14.f);
        verifyLbl.text = @"验证码";
        verifyLbl.textColor = ICEGlobalShadowBlackTextColor;
        verifyLbl.textAlignment = NSTextAlignmentCenter;

        verifyFld.leftView = verifyLbl;
        verifyFld.leftViewMode = UITextFieldViewModeAlways;

        _verifyFld = verifyFld;
    }
    return _verifyFld;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = ICEGlobalGrayBackgroundColor;
    }
    return _lineView;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:RGBAlpha(255, 255, 255, 0.5) forState:UIControlStateDisabled];
        _loginBtn.backgroundColor = ICEGlobalPinkColor;
    }
    return _loginBtn;
}

@end
