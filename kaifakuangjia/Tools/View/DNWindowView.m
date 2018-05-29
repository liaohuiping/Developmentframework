//
//  DNWindowView.m
//  WheatField
//
//  Created by dotnar on 2017/5/3.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNWindowView.h"
#import "AppDelegate.h"
#import "DNNoDataView.h"
#import "DNReloadDataView.h"
#import "DNLoadingView.h"
#import "DNBoxView.h"
#import "YLGIFImage.h"
#import "YLImageView.h"

@interface DNWindowView ()
@property (nonatomic,weak) AppDelegate* appdel;///<appdelegate
@property (nonatomic,strong) MBProgressHUD * hudLoading;///<loading的hud
@property (nonatomic,strong) MBProgressHUD * hudToast;///<toast的hud
@property (nonatomic,assign) NSInteger loadCount;///<loading数量
@property (nonatomic,assign) NSInteger normalLoadCount;///<loading数量
@property (nonatomic,assign) NSInteger toastCount;///<toast数量

@property (nonatomic,strong) UIView* coverView;///<遮盖层

@property (nonatomic,strong) UIAlertController* alertController;///<alertview;
@property (nonatomic,strong) UIAlertAction* cancleAction;///<alert 取消按钮
@property (nonatomic,strong) UIAlertAction* sureAction;///<alert 确定按钮

@property (nonatomic,strong) DNReloadDataView* reloadDataView;
@property (nonatomic,strong) DNNoDataView* noDataView;
@property (nonatomic,strong) DNLoadingView* loadingView;

@property (nonatomic,strong) DNBoxView* customAlertView;

@property (nonatomic,strong) UILabel* messageLabel;

@property (nonatomic,strong) UIActivityIndicatorView* activeView;

@property (nonatomic,strong) NSTimer* showTimer;



@end
static dispatch_once_t pred = 0;

static DNWindowView *singletonInstance = nil;

@implementation DNWindowView
#pragma mark -- 懒加载
-(DNLoadingView *)loadingView{
    if (!_loadingView) {
        _loadingView = [[DNLoadingView alloc]initWithFrame:CGRectMake(0, 0, kSceenWidth, kSceenHeight)];
    }
    return _loadingView;
}
-(MBProgressHUD *)hudLoading{
    if (!_hudLoading) {
        _hudLoading = [MBProgressHUD showHUDAddedTo:self.appdel.window animated:YES];
        _hudLoading.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        _hudLoading.bezelView.backgroundColor = [UIColor blackColor];
        _hudLoading.contentColor = [UIColor whiteColor];
    }
    return _hudLoading;
}

-(MBProgressHUD *)hudToast{
    if (!_hudToast) {
        _hudToast = [MBProgressHUD showHUDAddedTo:self.appdel.window animated:YES];
        _hudToast.mode = MBProgressHUDModeText;
        _hudToast.label.textColor = kColor_TitleMainColor;
        _hudToast.label.font = [UIFont systemFontOfSize:12];
//        _hudToast.offset = CGPointMake(0.f, MBProgressMaxOffset);
    }
    return _hudToast;
}
-(UIView *)coverView{
    if (!_coverView) {
        _coverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.appdel.window.frame), CGRectGetHeight(self.appdel.window.frame))];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha = 0.3;
        
    }
    return _coverView;
}

-(AppDelegate *)appdel{
    if (!_appdel) {
        _appdel = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    }
    return _appdel;
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

-(DNBoxView *)customAlertView{
    if (!_customAlertView) {
        _customAlertView = [[DNBoxView alloc]initWithFrame:CGRectMake(0, 0, kSceenWidth, kSceenHeight)];
    }
    return _customAlertView;
}
-(UILabel *)messageLabel{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _messageLabel.textColor = kColor_TitleMainColor;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.numberOfLines = 0;
        _messageLabel.font = [UIFont systemFontOfSize:13];
    }
    return _messageLabel;
}

-(UIActivityIndicatorView *)activeView{
    if (!_activeView) {
        _activeView = [[UIActivityIndicatorView alloc]init];
        _activeView.color = kColor_TitleMainColor;
    }
    return _activeView;
}



#pragma mark -- 单例
+ (id)sharedSingleInstance
{
    dispatch_once(&pred, ^{
        singletonInstance = [[super allocWithZone:NULL] init];
    });
    
    return singletonInstance;
}

-(void)destroyDealloc
{
    singletonInstance = nil;
    pred=0;
}
#pragma mark -- loading
-(void)showLoadingView{
    [self.showTimer invalidate];
    self.showTimer = nil;
    self.loadCount++;
     __weak typeof(self) weakSelf = self;
    //异常处理 当出现loadCount数量出现异常的时候 60秒后 手动清除
    
    self.showTimer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(timeFinished) userInfo:nil repeats:NO];
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.appdel.window addSubview:weakSelf.loadingView];
        weakSelf.loadingView.alpha = 0;
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.loadingView.alpha = 1;
        }];
    });

}
-(void)timeFinished{
    self.loadCount = 0;
    [self hideLoadingView];
}
-(void)hideLoadingView{
    self.loadCount--;
    if (self.loadCount<=0) {
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.showTimer invalidate];
            weakSelf.showTimer = nil;
            weakSelf.loadCount = 0;
            [weakSelf.loadingView removeFromSuperview];
            weakSelf.loadingView = nil;
        });

    }
    
}
-(void)deallocLoadingView{
    self.loadCount = 0;
    [self hideLoadingView];
    
}



#pragma mark -- loading
-(void)showNormalLoadingView{
    [self.showTimer invalidate];
    self.showTimer = nil;
    self.normalLoadCount++;
    __weak typeof(self) weakSelf = self;
    //异常处理 当出现loadCount数量出现异常的时候 60秒后 手动清除
    
    self.showTimer = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(timeNormalFinished:) userInfo:nil repeats:NO];
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.appdel.window addSubview:weakSelf.hudLoading];
    });
    
}
-(void)timeNormalFinished:(NSTimer*)timer{
    self.normalLoadCount = 0;
    [self hideNormalLoadingView];
}
-(void)hideNormalLoadingView{
    self.normalLoadCount--;
    if (self.normalLoadCount<=0) {
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.showTimer invalidate];
            weakSelf.showTimer = nil;
            weakSelf.normalLoadCount = 0;
            [weakSelf.hudLoading removeFromSuperview];
            weakSelf.hudLoading = nil;
        });
        
    }
    
}
-(void)deallocNormalLoadingView{
    self.normalLoadCount = 0;
    [self hideNormalLoadingView];
    
}

#pragma mark -- toast
-(void)showToastWithTitle:(NSString *)title andHiddenBlock:(ToastHiddenBlock)hiddenBlock{
    if (kStringIsEmpty(title)) {
        return;
    }
    self.toastCount++;
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf addCoverViewToWindow];
        weakSelf.hudToast.label.text = title;
        [weakSelf.hudToast showAnimated:YES];;
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf hideToast];
        if (hiddenBlock) {
            hiddenBlock();
        }
    });
}
-(void)hideToast{
    self.toastCount--;
    if (self.toastCount<=0) {
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf removeCoverViewToWinow];
            [weakSelf.hudToast hideAnimated:YES];
            weakSelf.hudToast = nil;
            [weakSelf removeCoverViewToWinow];
        });
    }
}

#pragma mark -- cover
-(void)addCoverViewToWindow{
//    [self.appdel.window addSubview:self.coverView];
}
-(void)removeCoverViewToWinow{
//    [self.coverView removeFromSuperview];
//    self.coverView = nil;
}

#pragma mark -- alertView

-(void)showAlertViewWithTitle:(NSString*)title message:(NSString*)message cancleTitle:(NSString*)cancleTitle sureTitle:(NSString*)sureTitle canleHandler:(void (^)())cancleClick sureHandler:(void (^)())sureClick{
    if (!kStringIsEmpty(title)||!kStringIsEmpty(message)) {
        self.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        self.alertController.view.layer.cornerRadius = kCornerRadius;
    }else{
        LogErrorLevel(@"提示信息为空");
        return;
    }
    if (!kStringIsEmpty(cancleTitle)) {
        self.cancleAction = [UIAlertAction actionWithTitle:cancleTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancleClick !=nil) {
                cancleClick();
            }
        }];
        [self.alertController addAction:self.cancleAction];
    }
    
    if (!kStringIsEmpty(sureTitle)) {
        self.sureAction = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (sureClick != nil) {
                sureClick();
            }
        }];
        [self.alertController  addAction:self.sureAction];
    }
    [[self.appdel.window rootViewController] presentViewController:self.alertController animated:YES completion:nil];
}


-(void)showCustomAlertViewWithMessage:(NSString *)message cancleTitle:(NSString *)cancleTitle sureTitle:(NSString *)sureTitle canleHandler:(void (^)())cancleClick sureHandler:(void (^)())sureClick{
    
    [self.customAlertView setupCancleButtonTitle:cancleTitle andSureButtonTitle:sureTitle];
    self.messageLabel.text = message;
    [self.customAlertView.customView addSubview:self.messageLabel];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.customAlertView.customView);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
    }];
    [self.customAlertView.customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(80);
    }];

    [self.appdel.window addSubview:self.customAlertView];
    __weak typeof(self) weakSelf = self;
    self.customAlertView.sureButtonClick = ^{
        if (sureClick != nil) {
            sureClick();
        }
        [weakSelf.customAlertView removeFromSuperview];
        weakSelf.customAlertView = nil;
    };
    self.customAlertView.cancleButtonClick = ^{
        if (cancleClick != nil) {
            cancleClick();
        }
        [weakSelf.customAlertView removeFromSuperview];
        weakSelf.customAlertView = nil;
    };
}

-(void)showNetFailureViewInView:(UIView*)inView reloadBlock:(void (^)())reloadNetBlock{
    self.reloadDataView.frame = inView.frame;
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


-(void)showNoDataViewInView:(UIView *)inView{
    self.noDataView.frame = inView.frame;
    [self.noDataView updateConstraints];
    __weak UIView* blockInView = inView;
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [blockInView addSubview:weakSelf.noDataView];
        [blockInView bringSubviewToFront:weakSelf.noDataView];
    });
    
}

-(void)hideNoDataView{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.noDataView removeFromSuperview];
    });
    
}

-(void)showActivityIndicatorViewInView:(UIView*)view withFrame:(CGRect)frame{
    self.activeView.frame = frame;
    [self.activeView updateConstraints];
    __weak UIView* blockInView = view;
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [blockInView addSubview:weakSelf.activeView];
        [blockInView bringSubviewToFront:weakSelf.activeView];
        [self.activeView startAnimating];
    });
    
}

-(void)hideActiveView{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.activeView stopAnimating];
        [self.activeView removeFromSuperview];
        self.activeView = nil;
    });
    
}




@end
