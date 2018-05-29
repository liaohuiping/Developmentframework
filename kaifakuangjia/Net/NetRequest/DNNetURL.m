//
//  DNNetURL.m
//  WheatField
//
//  Created by dotnar on 2017/5/31.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNNetURL.h"
#import "DNNetServerModel.h"

@implementation DNNetURL
+(NSString *)shareBaseNetAddress{
    NSString* baseUrl = [[[DNAccountService sharedSingleInstance]netServerModel]netBase];
    if (kStringIsEmpty(baseUrl)) {
        
        LogErrorLevel(@"网络地址为空");
    }
    return baseUrl;
}

//city
+(NSString*)getHotCityUrl{
    return String([DNNetURL shareBaseNetAddress],kURL_GetHotCity);
    
}
#pragma mark -- login
+(NSString*)loginUrl{
    return String([DNNetURL shareBaseNetAddress], kURL_Login);
}
+(NSString*)gestureLoginUrl{
    return String([DNNetURL shareBaseNetAddress], kURL_GestureLogin);
}
+(NSString*)loginOutUrl{
    return String([DNNetURL shareBaseNetAddress], kURL_LoginOut);
}
+(NSString*)registerUrl{
    return String([DNNetURL shareBaseNetAddress],kURL_Register);
}
+(NSString*)setupPaypwdUrl{
    return String([DNNetURL shareBaseNetAddress],kURL_SetupPaypwd);

}
+(NSString*)setupHandpwdUrl{
    return String([DNNetURL shareBaseNetAddress],kURL_SetupHandpwd);
    
}
+(NSString*)changeHandpwdUrl{
    return String([DNNetURL shareBaseNetAddress],kURL_SetupOpenpwd);
    
}
+(NSString*)verifyPhoneUrl{
    return String([DNNetURL shareBaseNetAddress],kURL_VerifyPhone);
}

+(NSString*)resetPwdUrl{
    return String([DNNetURL shareBaseNetAddress],kURL_ResetPwd);
}

+(NSString *)resetPayPwdUrl{
    return String([DNNetURL shareBaseNetAddress],kURL_ResetPayPwd);
}
+(NSString*)modifyPayPwdUrl{
    return String([DNNetURL shareBaseNetAddress], kURL_ModifyPayPwd);
}

+(NSString *)sendCodeUrl{
    return String([DNNetURL shareBaseNetAddress],kURL_SendCode);
}

+(NSString *)modifyUserInfoUrl{
    return String([DNNetURL shareBaseNetAddress], kURL_ModifyUserInfo);
}
+(NSString*)modifyPwdUrl{
    return String([DNNetURL shareBaseNetAddress], kURL_ModifyPwd);
}

+(NSString*)userTradeMsgUrl{
    return String([DNNetURL shareBaseNetAddress],kURL_UserTradeMsg);
}

+(NSString *)payRecieverInfoUrl{
    return String([DNNetURL shareBaseNetAddress], kURL_PayRecieverInfo);
}
+(NSString*)commitRollOutUrl{
   return String([DNNetURL shareBaseNetAddress], kURL_CommitRollOut);
}

+(NSString*)payListUrl{
    return String([DNNetURL shareBaseNetAddress], kURL_PayList);
}

+(NSString*)payDetailUrl{
    return String([DNNetURL shareBaseNetAddress],kURL_PayDetail);
}
+(NSString*)getTypeListUrl{
    return String([DNNetURL shareBaseNetAddress],kURL_GetTypeList);
}
+(NSString*)getTypeDetailListUrl{
    return String([DNNetURL shareBaseNetAddress],kURL_GetTypeDetailList);
}
+(NSString*)getRateUrl{
    return String([DNNetURL shareBaseNetAddress],kURL_GetRollOutRate);
}
+(NSString *)currencyGetCodeUrl{
    return String([DNNetURL shareBaseNetAddress], kURL_CurrencyGetCode);
}
+(NSString *)currencyBindAddressUrl{
    return String([DNNetURL shareBaseNetAddress], kURL_CurrencyBindAddress);
}
@end
