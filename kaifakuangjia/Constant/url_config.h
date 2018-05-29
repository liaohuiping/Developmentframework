//
//  url_config.h
//  WheatField
//
//  Created by dotnar on 2017/4/29.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#ifndef url_config_h
#define url_config_h

static NSString* const kAdd_ForceLanChinese= @"?lan=zh";
static NSString* const kAdd_ForceLanEnglish= @"?lan=en";

static NSString* const kURL_AppEnterpriseAddress = @"https://fir.im/kw82";

static NSString* const kURL_AppAddress= @"https://itunes.apple.com/cn/app/wheatfield/id1256259042";

static NSString* const kURL_FirimAppAddress= @"https://fir.im/gjfs";
static NSString* const kURL_ResoureImageBase= @"";///<图片
//static NSString* const kURL_ResoureImageBase= @"http://107.150.120.168/";///<图片url
//static NSString* const kURL_ResoureImageBase= @"http://192.168.2.170/";///<图片url
static NSString* const kURL_RechargeAddress = @"http://www.force-center.com/";///<充值跳转的网页
//static NSString* const kURL_RegisterEmailAddress = @"http://www.qeveworld.com/?/Register";///<注册邮箱跳转的网页

static NSString* const kURL_RegisterEmailAddress = @"/#/register";///<注册邮箱跳转的网页
static NSString* const kURL_ForgetLoginPWDAddress = @"/#/forgetPwd";///<忘记密码的网页
static NSString* const kURL_LoginEmailAddress = @"http://www.qeveworld.com";///<登录邮箱跳转的网页
//基本的url

static NSString* const kURL_ReleaseBase= @"http://app.wheat-farm.com/";///<发布的url

static NSString* const kURL_ReleasePhilippineBase= @"http://ptahs.vip/flbapp/";///<发布的url
///<发布的url
static NSString* const kURL_DebugBase= @"";///<开发的url

static NSString* const kURL_CheckBase= @"http://api.test-nginx-wheatfield.live2017.biz/";///<测试的url
static NSString* const kURL_LShBBase= @"http://192.168.2.81:8070/";///<刘盛波
//static NSString* const kURL_LShBBase= @"http://192.168.2.118:8071/";///<韦通文
static NSString* const kURL_FirimVersion= @"https://api.fir.im/apps/latest/";///<firim版本
//url详情


#pragma mark -- login
static NSString* const kURL_Login= @"user/login";///<登录
static NSString* const kURL_GestureLogin= @"user/loginhand";///<手势密码登录
static NSString* const kURL_LoginOut= @"user/logout";///<退出登录
static NSString* const kURL_Register= @"user/register";///<注册
static NSString* const kURL_SetupPaypwd= @"user/tokenpwd";///<设置支付密码
static NSString* const kURL_SetupHandpwd= @"user/handpwd";///<设置手势密码
static NSString* const kURL_SetupOpenpwd= @"user/openpwd";///<切换手势密码
static NSString* const kURL_VerifyPhone= @"code/validate";///<验证手机号
static NSString* const kURL_ResetPwd= @"user/newpwd";///<忘记密码,设置新登录密码
static NSString* const kURL_ResetPayPwd= @"user/paypwd";///<忘记密码,设置新登录密码
static NSString* const kURL_ModifyPayPwd= @"pay/paypwd";///<修改支付密码
static NSString* const kURL_SendCode= @"code/index";///<发送验证码
static NSString* const kURL_ModifyUserInfo= @"user/userinfo";///<修改用户信息
static NSString* const kURL_ModifyPwd= @"user/passwd";///<修改登录密码
static NSString* const kURL_GetHotCity= @"service/hotcity";///<获取热门城市
static NSString* const kURL_GetTypeList= @"business/catlist";///<获取分类下的列表
static NSString* const kURL_GetTypeDetailList= @"business/info";///<获取详细信息
static NSString* const kURL_GetRollOutRate= @"user/rate";///<获取汇率
static NSString* const kURL_CurrencyGetCode= @"code/lcc_code";///<绑定lcc提币获取验证码
static NSString* const kURL_CurrencyBindAddress= @"user/lcc_address";///<绑定lcc提币地址


#pragma mark -- 交易信息
static NSString* const kURL_UserTradeMsg= @"user/index";///<用户交易信息

#pragma mark -- 付币
static NSString* const kURL_PayRecieverInfo = @"pay/qrcode";///<付币时 获取收币人的信息
static NSString* const kURL_CommitRollOut = @"pay/pay";///<付币提交

#pragma Mark -- 交易记录相关
static NSString* const kURL_PayList = @"pay/paylist";///<（充值、提币、收币、付币 列表）

static NSString* const kURL_PayDetail = @"pay/info";///<（充值、提币、收币、付币 详情）

#endif /* url_config_h */
