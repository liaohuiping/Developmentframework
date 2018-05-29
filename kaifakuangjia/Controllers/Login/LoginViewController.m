//
//  LoginViewController.m
//  kaifakuangjia
//
//  Created by lhp on 2018/5/28.
//  Copyright © 2018年 lhp. All rights reserved.
//

#import "LoginViewController.h"
#import "DNActionSheetView.h"
#import "DNNetServerModel.h"
#import "DNLoginVMC.h"
#import "DNUserModel.h"
#import "HPTarBarViewController.h"

@interface LoginViewController ()

@property (nonatomic,strong) DNActionSheetView* addressActionSheetView;

@property (nonatomic,strong) UIButton* loginButton;

@property (nonatomic,strong) UIButton* netButton;

@property (nonatomic,strong) NSArray* netServerArr;

@property (nonatomic,strong) NSMutableArray* addressArr;

@property (nonatomic,strong) DNUserModel* userModel;

@end

@implementation LoginViewController

#pragma mark - 懒加载
- (UIButton *)loginButton {
    if (_loginButton == nil) {
        _loginButton = [[UIButton alloc] init];
        [_loginButton addTarget:self action: @selector(clickLoginButton:) forControlEvents: UIControlEventTouchUpInside];
        [_loginButton setTitle: Localized(kText_Login) forState: UIControlStateNormal];
        [_loginButton setTitle: Localized(kText_Login) forState: UIControlStateHighlighted];
        _loginButton.titleLabel.font = kFont_MainTitleFont;
        [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage imageWithColor:kColor_ButtonNomalColor] forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage imageWithColor:kColor_ButtonDisableColor] forState:UIControlStateDisabled];
        [_loginButton setBackgroundImage:[UIImage imageWithColor:kColor_ButtonHighlightColor] forState:UIControlStateHighlighted];
        _loginButton.layer.cornerRadius = kCornerRadius;
        _loginButton.layer.masksToBounds = YES;
        
    }
    return _loginButton;
}
- (UIButton *)netButton {
    if (_netButton == nil) {
        _netButton = [[UIButton alloc] init];
        [_netButton addTarget: self  action: @selector(netButtonClicked:) forControlEvents: UIControlEventTouchUpInside];
        
        [_netButton setTitle: [NSString stringWithFormat:@"请求地址切换:%@",[[[DNAccountService sharedSingleInstance] netServerModel] netBase]]forState: UIControlStateNormal];
        [_netButton setTitle: [NSString stringWithFormat:@"请求地址切换:%@",[[[DNAccountService sharedSingleInstance] netServerModel] netBase]] forState: UIControlStateHighlighted];
        [_netButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _netButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _netButton.backgroundColor = kColor_MainViewColor;
    }
    return _netButton;
}
-(DNActionSheetView *)addressActionSheetView{
    if (!_addressActionSheetView) {
        _addressActionSheetView = [[DNActionSheetView alloc]initWithFrame:CGRectMake(0, 0, kSceenWidth, kSceenHeight) withActionArr:self.addressArr];
    }
    return _addressActionSheetView;
}
-(NSArray *)netServerArr{
    if (!_netServerArr) {
        _netServerArr = [[DNAccountService sharedSingleInstance] netServerArr];
    }
    return _netServerArr;
}
-(NSMutableArray *)addressArr{
    if (!_addressArr) {
        _addressArr = [NSMutableArray  array];
        for (DNNetServerModel* netModel in self.netServerArr) {
            [_addressArr addObject: netModel.netDesStr];
        }
    }
    return _addressArr;
}
-(DNUserModel *)userModel{
    if (!_userModel) {
        _userModel = [[DNUserModel alloc] init];
    }
    return _userModel;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupView];
    
    [self setupLayout];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
#pragma mark -- 视图设置
- (void)setupView{
    
    [self.view addSubview:self.loginButton];
    
    [self.view addSubview:self.netButton];
    
#ifdef DEBUG
    self.netButton.hidden = NO;
#else
    self.netButton.hidden= YES;
#endif
    
}
- (void)setupLayout{

    [self.netButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(60);
    }];

    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.netButton.mas_bottom).mas_offset(100);
        make.height.mas_equalTo(kButtonHeight);
        make.left.mas_equalTo(kLeftBigInterval);
        make.right.mas_equalTo(-kRightBigInterval);
    }];
    
}
- (void)clickLoginButton:(UIButton*)button{
    [self loadLoginRequest];
}
-(void)netButtonClicked:(UIButton *)button{
    [self.view endEditing:YES];
    [self.vcAppdel.window addSubview:self.addressActionSheetView];
    __weak typeof(self) weakSelf = self;
    self.addressActionSheetView.cellDidSelected = ^(NSIndexPath *indexPath) {
        [weakSelf.addressActionSheetView removeFromSuperview];
        weakSelf.addressActionSheetView = nil;
        //切换网络后更新到单例中
        [[DNAccountService sharedSingleInstance]updateNetServerModel:[weakSelf.netServerArr objectAtIndex:indexPath.row]];
        [kUserDefaults setObject:[[[DNAccountService sharedSingleInstance] netServerModel] type] forKey:kUserDefaults_BaseUrl];
        [kUserDefaults synchronize];
        [weakSelf.netButton setTitle: [NSString stringWithFormat:@"请求地址切换:%@",[[[DNAccountService sharedSingleInstance] netServerModel] netBase]] forState: UIControlStateNormal];
        [weakSelf.netButton setTitle: [NSString stringWithFormat:@"请求地址切换:%@",[[[DNAccountService sharedSingleInstance] netServerModel] netBase]] forState: UIControlStateHighlighted];
    };
    
}
#pragma mark - 数据请求
- (void)loadLoginRequest{
    [self.view endEditing:YES];
    if (![self judgeDataLegal]) {
        return;
    }
    if (!self.netStatusEnable) {
        [self showNetFailureWithErrorDic:nil];
        return;
    }
    //请求成功跳转主界面
    [kUserDefaults setObject:@"1" forKey:kUserDefaults_UserId];
    [kUserDefaults synchronize];
    [kNotificationCenter postNotificationName:kNotification_ChangeWindowRoot object:nil];
    
    
//    [self showLoadingView];
//    __weak typeof(self) weakSelf = self;
//    DNLoginVMC* loginVMC = [[DNLoginVMC alloc] init];
//    [loginVMC setBlockWithReturnBlock:^(id returnValue) {
//        //请求成功处理
//    } WithErrorBlock:^(id errorCode) {
//        //返回错误代码
//        [weakSelf hideLoadingView];
//        [weakSelf showNetAlertViewErrorDic:errorCode];
//    } WithFailureBlock:^(NSError *error) {
//        //返回网络失败
//        [weakSelf hideLoadingView];
//        [weakSelf showNetFailureWithErrorDic:nil];
//    }];
//    [loginVMC loginWithUserModel:self.userModel];
}
#pragma mark -- 判断数据是否满足要求可以提交网路
-(BOOL)judgeDataLegal{
    LogWarnLevel(@"添加数据合理检测");
//    if (kStringIsEmpty(self.phoneTextField.text)) {
//        [self showToastMessage:Localized(kText_PhoneIsEmpty)];
//        return NO;
//    }else if (kStringIsEmpty(self.passwordTextField.text)){
//        [self showToastMessage:Localized(kText_PwdIsEmpty)];
//        return NO;
//    }else if (kStringIsEmpty(self.securityCodeTextField.text)){
//        [self showToastMessage:Localized(kText_CodeIsEmpty)];
//        return NO;
//    }
    return YES;
}
@end
