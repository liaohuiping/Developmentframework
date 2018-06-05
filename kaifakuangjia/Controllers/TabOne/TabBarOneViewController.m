//
//  TarBarOneViewController.m
//  kaifakuangjia
//
//  Created by lhp on 2018/5/28.
//  Copyright © 2018年 lhp. All rights reserved.
//

#import "TabBarOneViewController.h"

@interface TabBarOneViewController ()

@end

@implementation TabBarOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //没有网络情况下添加的view
    [self showNetFailureViewInView:self.view withFrame:CGRectMake(0, 0, kSceenWidth,kSceenHeight - kNavigationHeight - TarbarHeight) reloadBlock:^{
        //点击重新加载
    }];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [self showCustomNavigation];

    [self addCustomBackButton];

    [self addCustomRightButtodWithImage:nil withTitle:@"右按钮"];
    
}

/**
  返回按钮点击事件

 @param button  返回按钮
 */
- (void)backBtnClicked:(UIButton *)button{
    
}
/**
 右按钮点击事件

 @param button 右按钮
 */
- (void)rightBtnClicked:(UIButton *)button{
    
}
@end
