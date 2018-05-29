//
//  DNRootViewController.h
//  WheatField
//
//  Created by dotnar on 2017/4/29.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
typedef void (^AletrViewHiddenBlock)(void);///<提示文字隐藏完成时
typedef void (^ToastHiddenBlock)();///<Toast文字隐藏完成时
@interface DNRootViewController : UIViewController

@property (nonatomic,strong) id parameter;///< 正向传值参数

@property (nonatomic,assign) NSInteger tag;///< 正向传值时标识
@property (nonatomic,strong) id backParameter;///<反向传值的参数

@property(nonatomic,weak)AppDelegate  *vcAppdel;///<appdelegte

@property(nonatomic,assign)BOOL netStatusEnable;///<网络状态 YES/NO

@property (nonatomic,assign) BOOL haveExsitView;


-(UIImage *)imageByApplyingAlpha:(CGFloat )alpha image:(UIImage*)image;

/**
 *  @author Justin, 17-05-02 18:05:30
 *
 *  隐藏navigation
 */
-(void)hideNavigationBar;
/**
 *  @author Justin, 17-05-02 18:05:57
 *
 *  显示navigation
 */
-(void)showNavigationBar;

/**
 *  @author Justin, 17-05-02 18:05:18
 *
 *  nav push 一个视图
 *
 *  @param viewControllerName 将要推出控制器的名字
 *  @param animated           是否有动画
 */
-(void)pushDNViewController:(NSString*)viewControllerName animated:(BOOL)animated;
/**
 *  @author Justin, 17-05-02 18:05:24
 *
 *  nav push 一个视图 且有正向传值
 *
 *  @param viewControllerName 将要推出控制器的名字
 *  @param animated           是否有动画
 *  @param data               正向传值的参数
 */
-(void)pushDNViewController:(NSString*)viewControllerName animated:(BOOL)animated WithData:(id)data;

/**
 *  @author Justin, 17-05-02 18:05:24
 *
 *  nav push 一个视图 且有正向传值
 *
 *  @param viewControllerName 将要推出控制器的名字
 *  @param animated           是否有动画
 *  @param data               正向传值的参数
 */
-(void)pushDNViewController:(NSString*)viewControllerName animated:(BOOL)animated WithData:(id)data andTag:(NSInteger)tag;
/**
 *  @author Justin, 17-05-02 18:05:54
 *
 *  nav pop 一个视图
 *
 *  @param viewControllerName 将要pop控制器的名字
 *  @param animated           是否有动画
 */
-(void)popDNViewController:(NSString *)viewControllerName animated:(BOOL)animated;
/**
 *  @author Justin, 17-05-02 18:05:31
 *
 *  nav pop 一个视图 且有反向传值
 *
 *  @param viewControllerName 将要pop控制器的名字
 *  @param animated           是否有动画
 *  @param data               反向传值的参数
 */
-(void)popDNViewController:(NSString *)viewControllerName animated:(BOOL)animated WithData:(id)data;

/**
 *  @author Justin, 17-05-02 18:05:44
 *
 *  添加默认的自定义返回按钮
 */
-(void)addCustomBackButton;
/**
 *  @author Justin, 17-05-02 18:05:18
 *
 *  添加默认的自定义返回按钮
 *
 *  @param imageName 返回按钮的图片
 *  @param title 返回按钮的名字
 */
-(void)addCustomBackButtonWithImage:(NSString*)imageName withTitle:(NSString*)title;
/**
 *  @author Justin, 17-05-02 18:05:02
 *
 *  添加默认的自定义右侧按钮
 */
-(void)addCustomRightButton;
/**
 *  @author Justin, 17-05-02 18:05:24
 *  添加默认的自定义右侧按钮
 *
 *
 *  @param imageName 右侧按钮的图片
 *  @param title     右侧按钮的文字
 */
-(void)addCustomRightButtodWithImage:(NSString*)imageName withTitle:(NSString*)title;

/**
 *  @author Justin, 17-05-02 18:05:08
 *
 *  返回按钮的事件
 *
 *  @param button 返回按钮
 */
-(void)backBtnClicked:(UIButton*)button;
/**
 *  @author Justin, 17-05-02 18:05:30
 *
 *  右侧按钮的点击事件
 *
 *  @param button 右侧按钮
 */
-(void)rightBtnClicked:(UIButton*)button;
/**
 *  @author Justin, 17-05-02 18:05:58
 *
 *  网络请求error时 吐司
 *
 *  @param errorCode 错误信息
 */
-(void)showNetAlertViewErrorDic:(NSDictionary*)errorCode;
/**
 *  @author Justin, 17-05-02 18:05:46
 *
 *  网络请求failure时 吐司
 *
 *  @param errorCode 错误信息
 */
-(void)showNetFailureWithErrorDic:(NSDictionary*)errorCode;

/**
 *  @author Justin, 17-05-02 18:05:27
 *
 *  网络请求失败时 重新加载
 *
 *  @param reloadNetBlock 重新加载的block
 */
-(void)showNetFailureViewWithReloadBlock:(void (^)())reloadNetBlock;
/**
 *  @author Justin, 17-05-02 18:05:27
 *
 *  网络请求失败时 重新加载
 *
 *  @param reloadNetBlock 重新加载的block
 */
-(void)showNetFailureViewInView:(UIView*)inView withFrame:(CGRect)frame withTag:(NSInteger)tag reloadBlock:(void (^)())reloadNetBlock;
-(void)showNetFailureViewInView:(UIView*)inView withFrame:(CGRect)frame reloadBlock:(void (^)())reloadNetBlock;
/**
 *  @author Justin, 17-05-26 13:05:57
 *
 *  添加没有数据的默认视图
 */
-(void)showNodataView;
/**
 *  @author Justin, 17-05-26 13:05:37
 *
 *
 *  添加没有数据的默认视图
 *  @param inView 将视图添加到inview上
 */
-(void)showNoDataViewInView:(UIView *)inView withFrame:(CGRect)frame;
-(void)showNoDataViewInView:(UIView *)inView withFrame:(CGRect)frame withTag:(NSInteger)tag ;
/**
 *  @author Justin, 17-05-26 13:05:52
 *
 *  隐藏没有数据的默认视图
 */
-(void)hideNoDataView;
/**
 *  @author Justin, 17-05-26 13:05:52
 *
 *  隐藏没有数据的默认视图
 */
-(void)hideNoDataViewWithTag:(NSInteger)tag ;

/**
 *  @author Justin, 17-05-02 18:05:06
 *
 *  显示loading
 */
-(void)showLoadingView;
/**
 *  @author Justin, 17-05-02 18:05:06
 *
 *  显示loading
 */
-(void)hideLoadingView;

/**
 *  @author Justin, 17-05-02 18:05:06
 *
 *  显示loading
 */
-(void)showNormalLoadingView;
/**
 *  @author Justin, 17-05-02 18:05:06
 *
 *  显示loading
 */
-(void)hideNormalLoadingView;


/**
 *  @author Justin, 17-05-03 20:05:56
 *
 *  显示toast
 *
 *  @param title toast内容
 */

-(void)showToastWithTitle:(NSString*)title andHiddenBlock:(ToastHiddenBlock)hiddenBlock;

/**
 *  @author Justin, 17-05-03 20:05:56
 *
 *  显示toast
 *
 *  @param string toast内容
 */
-(void)showToastMessage:(NSString *)string;
/**
 *  @author Justin, 17-05-03 20:05:16
 *
 *  隐藏toast
 */

-(void)hideToast;
/**
 *  @author Justin, 17-05-04 10:05:03
 *
 *  alertviewcontoller
 *
 *  @param title       title
 *  @param message     msg
 *  @param cancleTitle 取消按钮文字
 *  @param sureTitle   确定按钮文字
 *  @param cancleClick 取消block
 *  @param sureClick   确定block
 */
-(void)showAlertViewWithTitle:(NSString*)title message:(NSString*)message cancleTitle:(NSString*)cancleTitle sureTitle:(NSString*)sureTitle canleHandler:(void (^)())cancleClick sureHandler:(void (^)())sureClick;

/**
 *  @author Justin, 17-05-04 10:05:03
 *
 *  alertviewcontoller
 *
 *  @param title       title
 *  @param message     msg
 *  @param cancleTitle 取消按钮文字
 *  @param sureTitle   确定按钮文字
 *  @param cancleClick 取消block
 *  @param sureClick   确定block
 */
-(void)showCustomAlertViewWithMessage:(NSString*)message cancleTitle:(NSString*)cancleTitle sureTitle:(NSString*)sureTitle canleHandler:(void (^)())cancleClick sureHandler:(void (^)())sureClick;

-(void)hideBackBtn;
-(void)shoBackBtn;

-(void)showCustomNavigation;
-(void)removeCustomNavigation;
-(void)showNavigation;
-(void)removeNavigation;

-(void)showGradualNavigation;
-(void)removeGradualNavigation;


-(void)showActiveViewInView:(UIView*)inView wihtFrame:(CGRect)frame;
-(void)hideActiveView;


-(void)hideTabbar;
-(void)showTabbar;

-(void)showSelectedAlertControlerWithTitle:(NSString*)title message:(NSString*)message andContentArr:(NSArray*)contents handle:(void (^) (NSInteger index))selectAlertClick;
@end
