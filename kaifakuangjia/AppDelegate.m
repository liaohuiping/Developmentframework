//
//  AppDelegate.m
//  kaifakuangjia
//
//  Created by lhp on 2018/4/9.
//  Copyright © 2018年 lhp. All rights reserved.
//

#import "AppDelegate.h"
#import <Bugly/Bugly.h>
#import "LoginViewController.h"
#import "HPTarBarViewController.h"

@interface AppDelegate ()

@property (nonatomic,strong)LoginViewController *loginVC;
@property (nonatomic,strong)HPTarBarViewController *tabController;
@property (nonatomic,strong)UINavigationController *navController;

@end

@implementation AppDelegate
-(BOOL)netStatusEnable{
    if (self.netStatus < 1) {
        return NO;
    }
    else{
        return YES;
    }
}
#pragma mark - 懒加载
-(HPTarBarViewController *)tabController{
    if (!_tabController) {
        _tabController = [[HPTarBarViewController alloc] init];
        [self setTabbarColor];
    }
    return _tabController;
}
-(LoginViewController *)loginVC{
    if (!_loginVC) {
        _loginVC = [[LoginViewController alloc] init];
    }
    return _loginVC;
}
-(UINavigationController *)navController{
    if (!_navController) {
        _navController = [[UINavigationController alloc] initWithRootViewController:self.loginVC];
    }
    return _navController;
}
-(UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];;
        _window.backgroundColor = [UIColor whiteColor];
    }
    return _window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setLanguage];
    
    [self netStatusReceive];
    
    [self setupNet];
    
    [self setupBugly];
    
    [self addNotification];
    
    [self loadWindowRootVC];

    return YES;
}

/**
 设置语言
 */
- (void)setLanguage{
    //没有设置过语言状态需要更新， 在跟随系统或者默认状态时每次都刷新状态（解决更改语言后的bug）
    if (kStringIsEmpty([kUserDefaults objectForKey:kUserDefaults_StringAppLanguage])||[kUserDefaults integerForKey:kUserDefaults_AppLanguage] == AppLanguageDefault || [kUserDefaults integerForKey:kUserDefaults_AppLanguage] == AppLanguageSystem) {
        [self setupInterationalState];
    }
}
#pragma mark - 初始化window界面
- (void)loadWindowRootVC{
    
    if (kStringIsEmpty([kUserDefaults objectForKey:kUserDefaults_UserId])) {
        
        self.window.rootViewController = self.navController;
    }else{
        self.window.rootViewController = self.tabController;
    }
    
    [self.window makeKeyAndVisible];
}
#pragma mark - 初始化Bugly
- (void)setupBugly{
    BuglyConfig * config = [[BuglyConfig alloc] init];
    
    config.reportLogLevel = BuglyLogLevelVerbose;
    
    config.blockMonitorEnable = YES;
    
    config.blockMonitorTimeout = 5;
    
    config.consolelogEnable = YES;
    
    config.channel = @"App";
    
    [Bugly startWithAppId:kService_BugglyAppId config:config];
#ifdef DEV
    [Bugly setUserIdentifier:[NSString stringWithFormat:@"Dev_App:%@", [UIDevice currentDevice].name]];
#elif ADHOC
    [Bugly setUserIdentifier:[NSString stringWithFormat:@"ADHOC_App:%@", [UIDevice currentDevice].name]];
#elif DIS
    [Bugly setUserIdentifier:[NSString stringWithFormat:@"Release_App:%@", [UIDevice currentDevice].name]];
#elif Enterprise
    [Bugly setUserIdentifier:[NSString stringWithFormat:@"Enterprise_App:%@", [UIDevice currentDevice].name]];
#else
    [Bugly setUserIdentifier:[NSString stringWithFormat:@"Dev_App:%@", [UIDevice currentDevice].name]];
#endif
    
    [Bugly setUserValue:[NSProcessInfo processInfo].processName forKey:@"App"];
}
#pragma mark -- 语言国际化
-(void)setupInterationalState{
    if ([kUserDefaults integerForKey:kUserDefaults_AppLanguage] == AppLanguageChina) {
        [kUserDefaults setObject:@"zh-Hans" forKey:kUserDefaults_StringAppLanguage];
    }
    else if ([kUserDefaults integerForKey:kUserDefaults_AppLanguage] == AppLanguageEnglish){
        [kUserDefaults setObject:@"en" forKey:kUserDefaults_StringAppLanguage];
    }
    else{
        if ([kCurrentLanguage hasPrefix:@"zh-Hans"]) {//开头匹配
            [kUserDefaults setObject:@"zh-Hans" forKey:kUserDefaults_StringAppLanguage];
        }else{
            [kUserDefaults setObject:@"en" forKey:kUserDefaults_StringAppLanguage];
        }
    }
    [kUserDefaults synchronize];
}
/**
 *  @author Lhp
 *
 *  设置tabbar选中未选中字体颜色
 */
- (void)setTabbarColor {
    
    UIColor *TAB_BAR_COLOR = kDNColorFromRGB(0x1c4668);
    
    // 字体颜色 选中
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12], NSForegroundColorAttributeName : TAB_BAR_COLOR} forState:UIControlStateSelected];
    
    // 字体颜色 未选中
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12],  NSForegroundColorAttributeName:kDNColorFromRGB(0x848484)} forState:UIControlStateNormal];
}
-(void)setupNet{
    
    if (!kObjectIsEmpty([kUserDefaults objectForKey:kUserDefaults_BaseUrl])) {
        return ;
    }
    [kUserDefaults setObject:[[[DNAccountService sharedSingleInstance] netServerModel]type] forKey:kUserDefaults_BaseUrl];
    
}
#pragma mark -- 网络状态检测
/**
 *  @author Lhp
 *
 *  网络状态检测
 */
-(void)netStatusReceive
{
    NSURL *baseURL = [NSURL URLWithString:@"https://www.baidu.com/"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    NSOperationQueue *operationQueue = manager.operationQueue;
    __weak NSOperationQueue *blockQuese=operationQueue;
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        LogInfoLevel(@"状态获取");
        
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [blockQuese setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [blockQuese setSuspended:YES];
                break;
        }
    }];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeNetStatus:) name:AFNetworkingReachabilityDidChangeNotification object:nil];
    //开始监控
    [manager.reachabilityManager startMonitoring];
    
}
/**
 *  @author Lhp
 *
 *  网络状态更改
 *
 *  @param note 通知
 */
-(void)changeNetStatus:(NSNotification *)note
{
    _netStatus=(AFNetworkReachabilityStatus)[[[note userInfo]objectForKey:@"AFNetworkingReachabilityNotificationStatusItem"]integerValue];
}
/**
 *  @author Lhp
 *
 *  根控制器切换的通知
 */
-(void)addNotification{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeWindowRootVC:) name:kNotification_ChangeWindowRoot object:nil];
}
/**
 *  @author Lhp
 *
 *  根控制器切换的通知
 *
 *  @param note 通知
 */
-(void)changeWindowRootVC:(NSNotification*)note{
    [self loadWindowRootVC];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"kaifakuangjia"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
