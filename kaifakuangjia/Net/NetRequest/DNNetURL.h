//
//  DNNetURL.h
//  WheatField
//
//  Created by dotnar on 2017/5/31.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNNetURL : NSObject
#pragma mark -- login
+(NSString*)loginUrl;///<登录url
+(NSString*)gestureLoginUrl;///<登录url
+(NSString*)loginOutUrl;///<退出登录url
+(NSString*)registerUrl;///<注册url
+(NSString*)setupPaypwdUrl;///<设置支付密码url
+(NSString*)setupHandpwdUrl;///<设置手势密码url
+(NSString*)changeHandpwdUrl;///<切换手势密码url
+(NSString*)verifyPhoneUrl;///<验证手机号
+(NSString*)resetPwdUrl;///<忘记密码，设置密码
+(NSString*)resetPayPwdUrl;///<忘记支付密码，设置支付密码
+(NSString*)modifyPayPwdUrl;///<修改支付密码
+(NSString*)sendCodeUrl;///<发送验证码
+(NSString*)modifyUserInfoUrl;///<修改用户信息
+(NSString*)modifyPwdUrl;///<修改登录密码
+(NSString*)getTypeListUrl;///<获取分类下的列表
+(NSString*)getTypeDetailListUrl;///<获取详细信息
+(NSString*)getRateUrl;///<获取详细信息
+(NSString*)currencyGetCodeUrl;///<绑定lcc提币获取验证码
+(NSString*)currencyBindAddressUrl;///<绑定lcc提币地址

//
+(NSString*)getHotCityUrl;
#pragma mark -- 交易信息
+(NSString*)userTradeMsgUrl;///<首页 用户信息

#pragma Mark -- 付币
+(NSString*)payRecieverInfoUrl;///<付币时 获取收币人的信息
+(NSString*)commitRollOutUrl;///<付币提交

#pragma Mark -- 交易记录相关
+(NSString*)payListUrl;///<（充值、提币、收币、付币 列表）
+(NSString*)payDetailUrl;///<充值、提币、收币、付币 详情


@end
