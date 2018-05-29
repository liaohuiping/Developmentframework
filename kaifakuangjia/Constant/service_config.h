//
//  service_config.h
//  WheatField
//
//  Created by dotnar on 2017/5/5.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#ifndef service_config_h
#define service_config_h

#define kURL_MakeysBase  [[[DNAccountService sharedSingleInstance]netServerModel]makeysBase]

#define kURL_LoginEmailAddress [[[DNAccountService sharedSingleInstance]netServerModel]emailBase]

#define kURL_RechargeAddress [[[DNAccountService sharedSingleInstance]netServerModel]forceBase]

static NSString* const kService_BugglyAppId = @"0ffd8d5201";///< bugly id

static NSString* const kService_ItunesAppId = @"";///<itunes id
//3368417481
#ifdef ADHOC
static NSString* const kService_FirimAppId = @"";///<firim appid
static NSString* const kService_FirimApiToken = @""; ///<firim api token
#else
static NSString* const kService_FirimAppId = @"";///<firim appid
static NSString* const kService_FirimApiToken = @""; ///<firim api token
#endif

static NSInteger const kService_PageLimit = 20;



//static NSString* const kService_JpushAppKey = @"85df4065d577df00b3c4d267"; ///<极光AppKey

static NSString* const kService_JpushAppKey = @""; ///<极光AppKey

static NSString* const kService_JpushChanel = @"AppStore"; ///<极光AppKey


static NSString* const kNetParamsValueAppkey = @"wujie9876543210";

#endif /* service_config_h */
