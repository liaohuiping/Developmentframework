//
//  DNWindowView.h
//  WheatField
//
//  Created by dotnar on 2017/5/3.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ToastHiddenBlock) ();///<吐司文字隐藏完成时\

/**
 *  @author Justin, 17-05-03 20:05:15
 *
 *  自定义 toast loading alert 等视图
 */
@interface DNWindowView : NSObject
/**
 *  @author Justin, 17-05-03 20:05:11
 *
 *  实例化一个变量
 *
 *  @return
 */
+ (id)sharedSingleInstance;
/**
 *  @author Justin, 17-05-03 20:05:31
 *
 *  销毁实例
 */
- (void)destroyDealloc;


/**
 *  @author Justin, 17-05-03 20:05:52
 *
 *  显示loading
 */
-(void)showLoadingView;
/**
 *  @author Justin, 17-05-03 20:05:41
 *
 *  隐藏loading
 */
-(void)hideLoadingView;
-(void)deallocLoadingView;
/**
 *  @author Justin, 17-05-03 20:05:52
 *
 *  显示loading
 */
-(void)showNormalLoadingView;
/**
 *  @author Justin, 17-05-03 20:05:41
 *
 *  隐藏loading
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

/**
 *  @author Justin, 17-05-02 18:05:27
 *
 *  网络请求失败时 重新加载
 *
 *  @param reloadNetBlock 重新加载的block
 */
-(void)showNetFailureViewInView:(UIView*)inView reloadBlock:(void (^)())reloadNetBlock;
/**
 *  @author Justin, 17-05-26 13:05:37
 *
 *
 *  添加没有数据的默认视图
 *  @param inView 将视图添加到inview上
 */
-(void)showNoDataViewInView:(UIView*)inView;
/**
 *  @author Justin, 17-05-26 13:05:52
 *
 *  隐藏没有数据的默认视图
 */
-(void)hideNoDataView;

-(void)showActivityIndicatorViewInView:(UIView*)view withFrame:(CGRect)frame;
-(void)hideActiveView;


@end
