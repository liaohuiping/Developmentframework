//
//  DNRootViewController.m
//  WheatField
//
//  Created by dotnar on 2017/4/29.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNRootViewController.h"
#import "NSString+Size.h"
#import "DNReloadDataView.h"
#import "DNNoDataView.h"
#import "DNResponseModel.h"
#import "DNWindowView.h"


@interface DNRootViewController ()
@property (nonatomic,strong) UIButton* backBtn;
@property (nonatomic,strong) UIButton* rigthBtn;
@property (nonatomic,strong) DNReloadDataView* reloadDataView;
@property (nonatomic,strong) DNNoDataView* noDataView;



@property (nonatomic,strong) DNReloadDataView* reloadDataView1;
@property (nonatomic,strong) DNReloadDataView* reloadDataView2;
@property (nonatomic,strong) DNReloadDataView* reloadDataView3;
@property (nonatomic,strong) DNReloadDataView* reloadDataView4;

@property (nonatomic,strong) DNNoDataView* noDataView1;
@property (nonatomic,strong) DNNoDataView* noDataView2;
@property (nonatomic,strong) DNNoDataView* noDataView3;
@property (nonatomic,strong) DNNoDataView* noDataView4;

@property (nonatomic,assign) NSInteger loadViewCount;


@end

@implementation DNRootViewController


-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]init];
        [_backBtn addTarget:self action:@selector(backBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        _backBtn.frame = CGRectMake(0, 0,44, 44);
        [_backBtn setTitleColor:kColor_TitleNormalColor forState:UIControlStateNormal];
        [_backBtn setTitleColor:kColor_TitleNormalColor forState:UIControlStateHighlighted];
    }
    return _backBtn;
}

-(UIButton *)rigthBtn{
    if (!_rigthBtn) {
        _rigthBtn = [[UIButton alloc]init];
        [_rigthBtn addTarget:self action:@selector(rightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        _rigthBtn.frame = CGRectMake(0, 0, 44, 44);
        [_rigthBtn setTitleColor:kColor_TitleNormalColor forState:UIControlStateNormal];
        [_rigthBtn setTitleColor:kColor_TitleNormalColor forState:UIControlStateHighlighted];
        _rigthBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _rigthBtn;
}

-(DNReloadDataView *)reloadDataView{
    if (!_reloadDataView) {
        _reloadDataView = [[DNReloadDataView alloc]initWithFrame:CGRectMake(0, 0, kSceenWidth, kSceenHeight)];
    }
    return _reloadDataView;
}

-(DNNoDataView *)noDataView{
    if (!_noDataView) {
        _noDataView = [[DNNoDataView alloc]initWithFrame:CGRectMake(0, 0, kSceenWidth, kSceenHeight)];
    }
    return _noDataView;
}


-(AppDelegate *)vcAppdel{
    if (!_vcAppdel) {
        _vcAppdel = (AppDelegate*)[UIApplication sharedApplication].delegate;
    }
    return _vcAppdel;
}

-(BOOL)netStatusEnable{
    return self.vcAppdel.netStatusEnable;
}


-(DNReloadDataView *)reloadDataView1{
    if (!_reloadDataView1) {
        _reloadDataView1 = [[DNReloadDataView alloc]initWithFrame:CGRectMake(0, 0, kSceenWidth, kSceenHeight)];
    }
    return _reloadDataView1;
}

-(DNReloadDataView *)reloadDataView2{
    if (!_reloadDataView2) {
        _reloadDataView2 = [[DNReloadDataView alloc]initWithFrame:CGRectMake(0, 0, kSceenWidth, kSceenHeight)];
    }
    return _reloadDataView2;
}

-(DNReloadDataView *)reloadDataView3{
    if (!_reloadDataView3) {
        _reloadDataView3 = [[DNReloadDataView alloc]initWithFrame:CGRectMake(0, 0, kSceenWidth, kSceenHeight)];
    }
    return _reloadDataView3;
}
-(DNReloadDataView *)reloadDataView4{
    if (!_reloadDataView4) {
        _reloadDataView4 = [[DNReloadDataView alloc]initWithFrame:CGRectMake(0, 0, kSceenWidth, kSceenHeight)];
    }
    return _reloadDataView4;
}
-(DNNoDataView *)noDataView1{
    if (!_noDataView1) {
        _noDataView1 = [[DNNoDataView alloc]initWithFrame:CGRectMake(0, 0, kSceenWidth, kSceenHeight)];
    }
    return _noDataView1;
}
-(DNNoDataView *)noDataView2{
    if (!_noDataView2) {
        _noDataView2 = [[DNNoDataView alloc]initWithFrame:CGRectMake(0, 0, kSceenWidth, kSceenHeight)];
    }
    return _noDataView2;
}
-(DNNoDataView *)noDataView3{
    if (!_noDataView3) {
        _noDataView3 = [[DNNoDataView alloc]initWithFrame:CGRectMake(0, 0, kSceenWidth, kSceenHeight)];
    }
    return _noDataView3;
}
-(DNNoDataView *)noDataView4{
    if (!_noDataView4) {
        _noDataView4 = [[DNNoDataView alloc]initWithFrame:CGRectMake(0, 0, kSceenWidth, kSceenHeight)];
    }
    return _noDataView4;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.loadViewCount = 0;
    self.view.backgroundColor = kColor_BackgroundColor;
    self.navigationItem.hidesBackButton = YES;
    // Do any additional setup after loading the view.
    self.vcAppdel.currentVC = self;
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.loadViewCount++;
    if (self.loadViewCount > 1) {
        self.haveExsitView = YES;
    }
    else{
        self.haveExsitView = NO;
    }
    
    self.vcAppdel.currentVC = self;
    LogInfoLevel(@"viewWillAppear:%@",NSStringFromClass([self class]));
    if ([NSStringFromClass([self class]) isEqualToString:kVC_Tabbar1]||[NSStringFromClass([self class]) isEqualToString:kVC_Tabbar2]||[NSStringFromClass([self class]) isEqualToString:kVC_Tabbar3]||[NSStringFromClass([self class]) isEqualToString:kVC_Tabbar4]||[NSStringFromClass([self class]) isEqualToString:kVC_GestureLock]||[NSStringFromClass([self class]) isEqualToString:kVC_QRCode]||[NSStringFromClass([self class]) isEqualToString:kVC_RollInCode]) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    else{
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
    if (_backBtn) {
        _backBtn.hidden = NO;
    }
    if (_rigthBtn) {
        _rigthBtn.hidden = NO;
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self hideNoDataView];
    if (_backBtn) {
        _backBtn.hidden = YES;
    }
    if (_rigthBtn) {
        _rigthBtn.hidden = YES;
    }
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    LogInfoLevel(@"viewDidDisapper:%@",NSStringFromClass([self class]));
    
}
-(void)dealloc
{
    LogInfoLevel(@"Delloc ->%@",NSStringFromClass([self class]));
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIImage *)imageByApplyingAlpha:(CGFloat )alpha image:(UIImage*)image
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, image.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}
-(void)hideNavigationBar{
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)showNavigationBar{
    [self.navigationController setNavigationBarHidden:NO];
}
-(void)pushDNViewController:(NSString *)viewControllerName animated:(BOOL)animated{
    Class vcClass = NSClassFromString(viewControllerName);
    id vc = [[vcClass alloc]  initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)pushDNViewController:(NSString *)viewControllerName animated:(BOOL)animated WithData:(id)data{
    Class vcClass = NSClassFromString(viewControllerName);
    DNRootViewController*  vc = [[vcClass alloc]  initWithNibName:nil bundle:nil];
    vc.parameter = data;
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)popDNViewController:(NSString *)viewControllerName animated:(BOOL)animated{
    Class vcClass = NSClassFromString(viewControllerName);
    BOOL isHave = NO;
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[vcClass class]]) {
            isHave = YES;
            [self.navigationController popToViewController:controller animated:YES];
            break;
        }
    }
    if (!isHave) {
        LogErrorLevel(@"pop未找到制定控制器 跳到跟控制器");
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
    
}

-(void)popDNViewController:(NSString *)viewControllerName animated:(BOOL)animated WithData:(id)data{
    Class vcClass = NSClassFromString(viewControllerName);
    BOOL isHave = NO;
    for (DNRootViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[vcClass class]]) {
            isHave = YES;
            controller.backParameter = data;
            [self.navigationController popToViewController:controller animated:YES];
            break;
        }
    }
    if (!isHave) {
        LogErrorLevel(@"pop未找到制定控制器 跳到跟控制器");
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

-(void)pushDNViewController:(NSString*)viewControllerName animated:(BOOL)animated WithData:(id)data andTag:(NSInteger)tag{
    Class vcClass = NSClassFromString(viewControllerName);
    DNRootViewController*  vc = [[vcClass alloc]  initWithNibName:nil bundle:nil];
    vc.parameter = data;
    vc.tag = tag;
    [self.navigationController pushViewController:vc animated:YES];
}



-(void)addCustomBackButton{
    [self.backBtn setImage:[UIImage imageNamed:kImage_RootBack]forState:UIControlStateNormal];
    [self.backBtn setImage:[UIImage imageNamed:kImage_RootBack]forState:UIControlStateHighlighted];
    [self.navigationController.navigationBar addSubview:self.backBtn];
    self.backBtn.frame  = CGRectMake(0, 0, 49, 44);
}

-(void)addCustomBackButtonWithImage:(NSString *)imageName withTitle:(NSString *)title{
    UIButton* copyButton = [[UIButton alloc]initWithFrame:self.backBtn.frame];
    copyButton.titleLabel.font = self.backBtn.titleLabel.font;
    if (!kStringIsEmpty(title)) {
        [self.backBtn setTitle:title forState:UIControlStateNormal];
        [self.backBtn setTitle:title forState:UIControlStateHighlighted];
        self.backBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [copyButton setTitle:title forState:UIControlStateNormal];
        copyButton.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    if (!kStringIsEmpty(imageName)) {
        [self.backBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [self.backBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
        [copyButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [copyButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    }
    
    [self.view addSubview:copyButton];
    [copyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        if (!kStringIsEmpty(title)) {
             make.left.mas_equalTo(12);
        }
        else{
             make.left.mas_equalTo(0);
        }
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(44);
        make.width.mas_greaterThanOrEqualTo(49);
    }];
     [self.backBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, -5)];

    [self.view layoutIfNeeded];
    CGRect frame = copyButton.frame;
    [copyButton removeFromSuperview];
    copyButton = nil;
    self.backBtn.frame = frame;
    [self.navigationController.navigationBar addSubview:self.backBtn];
}

-(void)addCustomRightButton{
    [self.rigthBtn setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
    [self.rigthBtn setImage:[UIImage imageNamed:@""]forState:UIControlStateHighlighted];
    [self.navigationController.navigationBar addSubview:self.rigthBtn];
    self.rigthBtn.frame  =CGRectMake(0, 0,kSceenWidth-44,44);
}

-(void)addCustomRightButtodWithImage:(NSString *)imageName withTitle:(NSString *)title{
    UIButton* copyButton = [[UIButton alloc]initWithFrame:self.rigthBtn.frame];
    copyButton.titleLabel.font = self.rigthBtn.titleLabel.font;
    if (!kStringIsEmpty(title)) {
        [self.rigthBtn setTitle:title forState:UIControlStateNormal];
        [self.rigthBtn setTitle:title forState:UIControlStateHighlighted];
        self.rigthBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [copyButton setTitle:title forState:UIControlStateNormal];
        copyButton.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    if (!kStringIsEmpty(imageName)) {
        [self.rigthBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [self.rigthBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
        [copyButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [copyButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    }
    
    
    [self.view addSubview:copyButton];
    [copyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        if (!kStringIsEmpty(title)) {
            make.right.mas_equalTo(-12);
        }
        else{
            make.right.mas_equalTo(0);
        }
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(44);
        make.width.mas_greaterThanOrEqualTo(44);
    }];
    [self.view layoutIfNeeded];
    CGRect frame = copyButton.frame;
    [copyButton removeFromSuperview];
    copyButton = nil;
    self.rigthBtn.frame = frame;
    [self.navigationController.navigationBar addSubview:self.rigthBtn];
    
}
-(void)backBtnClicked:(UIButton*)button{
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightBtnClicked:(UIButton*)button{
    
}

-(void)showNetAlertViewErrorDic:(DNResponseModel*)errorCode{
    [[DNWindowView sharedSingleInstance] showToastWithTitle:errorCode.msg andHiddenBlock:NULL];
}

-(void)showNetFailureWithErrorDic:(NSDictionary*)errorCode{
    [[DNWindowView sharedSingleInstance] showToastWithTitle:Localized(kText_ToastNetworkAnomaly) andHiddenBlock:NULL];
}

-(void)showNetFailureViewWithReloadBlock:(void (^)())reloadNetBlock{
    self.reloadDataView.frame = self.view.frame;
    [self.reloadDataView updateConstraints];
    __weak UIView* blockInView = self.view;
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [blockInView addSubview:weakSelf.reloadDataView];
        [blockInView bringSubviewToFront:weakSelf.reloadDataView];
    });
    
    self.reloadDataView.reloadButtonClick = ^{
        if (reloadNetBlock) {
            reloadNetBlock();
        }
    };
}
-(void)showNetFailureViewInView:(UIView*)inView withFrame:(CGRect)frame reloadBlock:(void (^)())reloadNetBlock{
    self.reloadDataView.frame = frame;
    [self.reloadDataView updateConstraints];
    __weak UIView* blockInView = inView;
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [blockInView addSubview:weakSelf.reloadDataView];
        [blockInView bringSubviewToFront:weakSelf.reloadDataView];
    });
    
    self.reloadDataView.reloadButtonClick = ^{
        [weakSelf.reloadDataView removeFromSuperview];
        if (reloadNetBlock) {
            reloadNetBlock();
        }
    };
}

-(void)showNetFailureViewInView:(UIView*)inView withFrame:(CGRect)frame withTag:(NSInteger)tag reloadBlock:(void (^)())reloadNetBlock{

    DNReloadDataView* reloadDataView = nil;
    switch (tag) {
        case 0:
            reloadDataView = self.reloadDataView1;
            break;
        case 1:
            reloadDataView = self.reloadDataView2;
            break;
        case 2:
            reloadDataView = self.reloadDataView3;
            break;
        case 3:
            reloadDataView = self.reloadDataView4;
            break;
        default:
            reloadDataView = self.reloadDataView;
            break;
    }
    reloadDataView.frame = frame;

    [reloadDataView updateConstraints];
    __weak UIView* blockInView = inView;
    __weak DNReloadDataView* blockReloadView = reloadDataView;
    dispatch_async(dispatch_get_main_queue(), ^{
        [blockInView addSubview:blockReloadView];
        [blockInView bringSubviewToFront:blockReloadView];
    });
    
    reloadDataView.reloadButtonClick = ^{
        if (reloadNetBlock) {
            reloadNetBlock();
        }
        [blockReloadView removeFromSuperview];
    };
    
}


-(void)showNodataView{
    self.noDataView.frame = self.view.frame;
    [self.noDataView updateConstraints];
    __weak UIView* blockInView = self.view;
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [blockInView addSubview:weakSelf.noDataView];
        [blockInView bringSubviewToFront:weakSelf.noDataView];
    });
}
-(void)showNoDataViewInView:(UIView *)inView withFrame:(CGRect)frame{
    self.noDataView.frame = frame;
    [self.noDataView updateConstraints];
    __weak UIView* blockInView = inView;
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [blockInView addSubview:weakSelf.noDataView];
        [blockInView bringSubviewToFront:weakSelf.noDataView];
    });
    
}
-(void)showNoDataViewInView:(UIView *)inView withFrame:(CGRect)frame withTag:(NSInteger)tag{

    DNNoDataView* noDataView = nil;
    switch (tag) {
        case 0:
            noDataView = self.noDataView1;
            break;
        case 1:
            noDataView = self.noDataView2;
            break;
        case 2:
            noDataView = self.noDataView3;
            break;
        case 3:
            noDataView = self.noDataView4;
            break;
        default:
            noDataView = self.noDataView;
            break;
    }
    noDataView.frame = frame;
    [noDataView updateConstraints];
    __weak UIView* blockInView = inView;
    __weak DNNoDataView* blockNoView = noDataView;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong DNNoDataView* strongNoView = blockNoView;
        [blockInView addSubview:strongNoView];
        [blockInView bringSubviewToFront:strongNoView];
    });
}
-(void)hideNoDataView{
    [self.noDataView removeFromSuperview];
    self.noDataView = nil;
    
    [self.noDataView1 removeFromSuperview];
    self.noDataView1 = nil;
    
    [self.noDataView2 removeFromSuperview];
    self.noDataView2 = nil;
    
    [self.noDataView3 removeFromSuperview];
    self.noDataView3 = nil;
    
    [self.noDataView4 removeFromSuperview];
    self.noDataView4 = nil;
}


-(void)hideNoDataViewWithTag:(NSInteger)tag{
    DNNoDataView* noDataView = nil;
    switch (tag) {
        case 0:
            noDataView = self.noDataView1;
            break;
        case 1:
            noDataView = self.noDataView2;
            break;
        case 2:
            noDataView = self.noDataView3;
            break;
        case 3:
            noDataView = self.noDataView4;
            break;
        default:
            noDataView = self.noDataView;
            break;
    }
    [noDataView removeFromSuperview];
    noDataView = nil;

    
}

-(void)showLoadingView{
    [[DNWindowView sharedSingleInstance] showLoadingView];
}

-(void)hideLoadingView{
    [[DNWindowView sharedSingleInstance] hideLoadingView];
}


-(void)showNormalLoadingView{
    [[DNWindowView sharedSingleInstance]showNormalLoadingView];
}

-(void)hideNormalLoadingView{
    [[DNWindowView sharedSingleInstance] hideNormalLoadingView];
}

/**
 *  @author Justin, 17-05-03 20:05:56
 *
 *  显示toast
 *
 *  @param title toast内容
 */
-(void)showToastWithTitle:(NSString*)title andHiddenBlock:(ToastHiddenBlock)hiddenBlock{
    [[DNWindowView sharedSingleInstance] showToastWithTitle:title andHiddenBlock:^{
        if (hiddenBlock) {
            hiddenBlock();
        }
    }];
}
/**
 *  @author Justin, 17-05-03 20:05:56
 *
 *  显示toast
 *
 *  @param string toast内容
 */
- (void)showToastMessage:(NSString *)string{
    __weak typeof(self) weakSelf = self;
    [weakSelf showToastWithTitle:string andHiddenBlock:^{
        [weakSelf hideToast];
        
    }];
}
/**
 *  @author Justin, 17-05-03 20:05:16
 *
 *  隐藏toast
 */
-(void)hideToast{
}

-(void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancleTitle:(NSString *)cancleTitle sureTitle:(NSString *)sureTitle canleHandler:(void (^)())cancleClick sureHandler:(void (^)())sureClick{
    [[DNWindowView sharedSingleInstance] showAlertViewWithTitle:title message:message cancleTitle:cancleTitle sureTitle:sureTitle canleHandler:cancleClick sureHandler:sureClick];
}

-(void)showCustomAlertViewWithMessage:(NSString *)message cancleTitle:(NSString *)cancleTitle sureTitle:(NSString *)sureTitle canleHandler:(void (^)())cancleClick sureHandler:(void (^)())sureClick{
    [[DNWindowView sharedSingleInstance] showCustomAlertViewWithMessage:message cancleTitle:cancleTitle sureTitle:sureTitle canleHandler:cancleClick sureHandler:sureClick];
}

-(void)hideBackBtn{
    self.backBtn.hidden = YES;
}

-(void)shoBackBtn{
    self.backBtn.hidden = NO;
}

-(void)showCustomNavigation{
    NSDictionary* attributes =  @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName : [UIFont systemFontOfSize:18] };
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithWithColor:kColor_MainViewColor frame:CGRectMake(0, 0, kSceenWidth, kNavigationHeight)]
                            forBarPosition:UIBarPositionAny
                                barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.rigthBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.rigthBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
}
-(void)showNavigation{
    NSDictionary* attributes =  @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName : [UIFont systemFontOfSize:18] };
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"clear"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.rigthBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.rigthBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
}
-(void)removeCustomNavigation{
    NSDictionary* attributes =  @{NSForegroundColorAttributeName : kColor_TitleMainColor,NSFontAttributeName : [UIFont systemFontOfSize:18] };
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithWithColor:kDNColorFromRGB(0xFFFFFF) frame:CGRectMake(0, 0, kSceenWidth, kNavigationHeight)]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.backBtn setTitleColor:kColor_TitleNormalColor forState:UIControlStateNormal];
    [self.backBtn setTitleColor:kColor_TitleNormalColor forState:UIControlStateHighlighted];
    [self.rigthBtn setTitleColor:kColor_TitleNormalColor forState:UIControlStateNormal];
    [self.rigthBtn setTitleColor:kColor_TitleNormalColor forState:UIControlStateHighlighted];
 
}

-(void)showGradualNavigation{
    NSDictionary* attributes =  @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName : [UIFont systemFontOfSize:18] };
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:kImage_GradualNavBg]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.rigthBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.rigthBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
}
-(void)removeGradualNavigation{
    [self removeCustomNavigation];
    
}

-(void)showActiveViewInView:(UIView *)inView wihtFrame:(CGRect)frame{
    [[DNWindowView sharedSingleInstance]showActivityIndicatorViewInView:inView withFrame:frame];
}
-(void)hideActiveView{
    [[DNWindowView sharedSingleInstance] hideActiveView];
}


-(void)hideTabbar{
    self.tabBarController.tabBar.hidden = YES;
}

-(void)showTabbar{
    self.tabBarController.tabBar.hidden = NO;

}
-(void)showSelectedAlertControlerWithTitle:(NSString*)title message:(NSString*)message andContentArr:(NSArray*)contents handle:(void (^) (NSInteger index))selectAlertClick{
    
    UIAlertController*  selectedAlertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (int i = 0; i < contents.count; i++) {
        NSString* content = [contents objectAtIndex:i];
        if (i == contents.count-1) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:content style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                selectAlertClick(i);
            }];
            [action setValue:[UIColor redColor] forKey:@"titleTextColor"];
            [selectedAlertController addAction:action];
        }else{
            UIAlertAction *action = [UIAlertAction actionWithTitle:content style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                selectAlertClick(i);
            }];

            [action setValue:kColor_MainViewColor forKey:@"titleTextColor"];
            [selectedAlertController addAction:action];
        }
    }
    [self presentViewController:selectedAlertController animated:YES completion:nil];
}

@end
