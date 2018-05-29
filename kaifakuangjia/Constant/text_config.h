//
//  text_config.h
//  WheatField
//
//  Created by dotnar on 2017/4/29.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#ifndef text_config_h
#define text_config_h

static NSString* const kText_NotificationTap = @"NotificationTap";
static NSString* const kText_NotificationJump = @"@qeveworld.com";

static NSString* const kText_ResponeCodeSuccess = @"2000";//这两个参数服务器不能修改
static NSString* const kText_ResponeOptSuccess = @"SUCCESS";//这两个返回值不能修改
static NSString* const kText_ResponeCodeOverdue = @"4021";


static NSString* const kText_DefaultCurrency= @"0.0000";

static NSString* const kText_VoidString= @"VoidSting";

static NSString* const kText_HotPay = @"HotPay";

static NSString* const kText_Week = @"Week";
static NSString* const kText_Day = @"Day";
static NSString* const kText_Hour = @"Hour";
static NSString* const kText_Minute = @"Minute";
static NSString* const kText_Second = @"Second";
static NSString* const kText_SexMale= @"SexMale";
static NSString* const kText_SexFemale = @"SexFemale";

static NSString* const kText_UpdateNewVersion = @"UpdateNewVersion";
static NSString* const kText_UpdateNewVersionSize = @"UpdateNewVersionSize";
static NSString* const kText_UpdateNewVersionContent = @"UpdateNewVersionContent";
static NSString* const kText_UpdateIgnore= @"UpdateIgnore";
static NSString* const kText_UpdateVersion= @"UpdateVersion";

static NSString* const kText_NoNetReloadData = @"NoNetReloadData";
static NSString* const kText_NoData = @"NoData";
static NSString* const kText_ReloadData = @"ReloadData";


static NSString* const kText_Sure = @"Sure";
static NSString* const kText_Cancle = @"Cancle";
static NSString* const kText_Tabbar1 = @"Tabbar1";
static NSString* const kText_Tabbar2 = @"Tabbar2";
static NSString* const kText_Tabbar3 = @"Tabbar3";
static NSString* const kText_Tabbar4 = @"Tabbar4";

static NSString* const kText_LanguageFollow = @"LanguageFollow";
static NSString* const kText_LanguageCH = @"LanguageCH";
static NSString* const kText_LanguageEN = @"LanguageEN";
static NSString* const kText_LanguageSet = @"LanguageSet";
static NSString* const kText_ToastNetworkAnomaly = @"NetworkAnomaly";
static NSString* const kText_GetSecurityCode = @"GetSecurityCode";

//login
static NSString* const kText_Login= @"Login";



//图片名称
static NSString* const kImage_IntroduceOne= @"Intro1";
static NSString* const kImage_IntroduceTwo= @"Intro2";
static NSString* const kImage_IntroduceThree= @"Intro3";
static NSString* const kImage_IntroduceFour= @"Intro4";

static NSString* const kImage_Tabbar1Nomarl= @"kImage_Tabbar1_n";
static NSString* const kImage_Tabbar1Selected= @"kImage_Tabbar1_s";
static NSString* const kImage_Tabbar2Nomarl= @"kImage_Tabbar2_n";
static NSString* const kImage_Tabbar2Selected= @"kImage_Tabbar2_s";
static NSString* const kImage_Tabbar3Nomarl= @"kImage_Tabbar3_n";
static NSString* const kImage_Tabbar3Selected= @"kImage_Tabbar3_s";
static NSString* const kImage_Tabbar4Nomarl= @"kImage_Tabbar4_n";
static NSString* const kImage_Tabbar4Selected= @"kImage_Tabbar4_s";

static NSString* const kImage_NoData= @"no_data";
static NSString* const kImage_NoNet= @"no_net";
static NSString* const kImage_LoadingBackView = @"loading_back";
static NSString* const kImage_GifLoading= @"loading.gif";
static NSString* const kImage_RootBack = @"root_back";
static NSString* const kImage_GradualNavBg = @"gradual_nav_bg";

static NSString* const kTime_ServerFormmatter = @"yyyy-MM-dd HH:mm:ss";
static NSString* const kTime_DateFormmatter = @"yyyy-MM-dd";
static NSString* const kTime_TimeFormmatter = @"HH:mm:ss";
static NSString* const kTime_DayFormmatter = @"MM/dd";
static NSString* const kTime_DontFormmatter = @"yyyy.MM.dd HH:mm:ss";

static NSString* const kTime_DateDontFormmatter = @"yyyy.MM.dd";

//服务器返回的字段
static NSString* const kUserDefaults_Token = @"token";
static NSString* const kUserDefaults_UserId = @"userId";
static NSString* const kUserDefaults_Email = @"email";
static NSString* const kUserDefaults_Nickname = @"Nickname";
static NSString* const kUserDefaults_HeadImageFile = @"headImageFile";
static NSString* const kUserDefaults_Phone= @"phone";
static NSString* const kUserDefaults_CountryType= @"countryType";
static NSString* const kUserDefaults_is_paypwd= @"is_paypwd";
static NSString* const kUserDefaults_is_hand= @"is_hand";
static NSString* const kUserDefaults_isopen_hand= @"isopen_hand";
static NSString* const kUserDefaults_isGestureOrAccountLogin= @"isGestureOrAccountLogin";
static NSString* const kUserDefaults_LoginPassword = @"loginPassword";
static NSString* const kUserDefaults_AppLanguage = @"AppLanguage";
static NSString* const kUserDefaults_StringAppLanguage= @"StringAppLanguage";
#define kUserDefaults_LoadedIntroduce [NSString stringWithFormat:@"LoadedIntroduce-%@",kAppVersion]
static NSString* const kUserDefaults_BaseUrl = @"BaseUrl";

static NSString* const kUserDefaults_HaveJpushServer = @"HaveJpushServer";

static NSString* const kNotification_ChangeWindowRoot = @"ChangeWindowRoot";
static NSString* const kNotification_ChangeInterationalState = @"ChangeInterationalState";
static NSString* const kNotification_LoginLose = @"LoginLose";
static NSString* const kNotification_LogingOut = @"LogingOut";//正在退出登录
static NSString* const kNotification_JpushServer = @"JpushServer";//推送服务

static NSString* const kNotification_MsgRemindSetupActive = @"MsgRemindSetupActive";//设置是否有消息提醒时进入前后台刷新数据


#pragma --Net
//Appkey由服务器分配
static NSString* const kNetParamsValueAppType = @"IOS";
static NSString* const kNetParamsValueLangZh_cn = @"zh-cn";
static NSString* const kNetParamsValueLangEn_us = @"en-us";
static NSString* const kNetParamsValueSendCodeTypeSetpwd = @"setpwd";
static NSString* const kNetParamsValueSendCodeTypeRegister = @"register";
static NSString* const kNetParamsValueSendCodeTypeInit = @"Init";
static NSString* const kNetParamsValueSendCodeTypePaypwd = @"paypwd";
static NSString* const kNetParamsValueSendCodeTypeLogin= @"login";
static NSString* const kNetParamsKeyAppkey = @"appkey";
static NSString* const kNetParamsKeySecretkey = @"secretkey";
static NSString* const kNetParamsKeyTime = @"time";
static NSString* const kNetParamsKeyAppType = @"appType";
static NSString* const kNetParamsKeyImeicode = @"imeicode";
static NSString* const kNetParamsKeyOnline_rifid = @"online_rfid";
static NSString* const kNetParamsKeyUser_id = @"user_id";
static NSString* const kNetParamsKeyLanguage = @"lang";


#define KCellID_CountryTableViewCell @"CountryTableViewCell" //用静态变量时cell重用的时候 会让静态变量赋值给另一个静态变量导致
#define KCellID_DefaultTabCell @"DefaultTableCell"


#endif /* text_config_h */
