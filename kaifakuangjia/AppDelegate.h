//
//  AppDelegate.h
//  kaifakuangjia
//
//  Created by lhp on 2018/4/9.
//  Copyright © 2018年 lhp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@class DNRootViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(nonatomic,assign)AFNetworkReachabilityStatus netStatus;

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property(nonatomic,assign)BOOL netStatusEnable;///<网络状态 YES/NO

@property (nonatomic,weak) DNRootViewController* currentVC;

- (void)saveContext;


@end

