//
//  HPTarBarViewController.m
//  kaifakuangjia
//
//  Created by lhp on 2018/5/28.
//  Copyright © 2018年 lhp. All rights reserved.
//

#import "HPTarBarViewController.h"
#import "TabBarOneViewController.h"
#import "TabBarTwoViewController.h"
#import "TabBarThreeViewController.h"
#import "TabBarFourViewController.h"

@interface HPTarBarViewController ()

@end

@implementation HPTarBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化tabbar界面
    TabBarOneViewController *home = [[TabBarOneViewController alloc] init];
    [self addChildViewController:home forTitle: Localized(kText_Tabbar1) imageName:kImage_Tabbar1Nomarl selectedImageName:kImage_Tabbar1Selected];

    TabBarTwoViewController *tabBarTwo = [[TabBarTwoViewController alloc] init];
    [self addChildViewController:tabBarTwo forTitle: Localized(kText_Tabbar2) imageName:kImage_Tabbar2Nomarl selectedImageName:kImage_Tabbar2Selected];
    
    TabBarThreeViewController *tabBarThree = [[TabBarThreeViewController alloc] init];
    [self addChildViewController:tabBarThree forTitle: Localized(kText_Tabbar3) imageName:kImage_Tabbar3Nomarl selectedImageName:kImage_Tabbar3Selected];
    
    TabBarFourViewController *tabBarFour = [[TabBarFourViewController alloc] init];
    [self addChildViewController:tabBarFour forTitle: Localized(kText_Tabbar4) imageName:kImage_Tabbar4Nomarl selectedImageName:kImage_Tabbar4Selected];
    
}
- (void)addChildViewController:(UIViewController *)childController forTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    childController.title = title;
    childController.tabBarItem.title = title;
    childController.tabBarItem.image = [[UIImage imageNamed: imageName] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed: selectedImageName] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: childController];
    [self addChildViewController:nav];
}
@end
