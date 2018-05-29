//
//  DNUserModel.h
//  WheatField
//
//  Created by dotnar on 2017/6/16.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+AddMsg.h"

@interface DNUserModel : NSObject

@property (nonatomic,strong) NSString* password;
@property (nonatomic,strong) NSString* email;
@property (nonatomic,strong) NSString* securityCode;

@property (nonatomic,strong) NSString* nickname;
@property (nonatomic,assign) SexType sex;///<1男性、0女性
@property (nonatomic,strong) UIImage* headImage;
@property (nonatomic,strong) NSString* headImageFile;
@property (nonatomic,strong) NSString* userId;
@property (nonatomic,strong) NSString* token;
@property (nonatomic,strong) NSString* phone;

@property (nonatomic,strong) NSString* countryString;
@property (nonatomic,strong) NSString* countryType;

@property (nonatomic,strong) NSString* payPassword;

@property (nonatomic,strong) NSString* oldPassword;
@property (nonatomic,strong) NSString* oldPayPwd;

@property (nonatomic,strong) NSString* sjCode;///<验证验证码后的随机码（忘记密码）

@property (nonatomic,strong) NSString* qrCode;//支付时的收款码

@property (nonatomic,strong) NSString* payPwdToken;///<首次设置支付密码的token

@property (nonatomic,assign) BOOL havePaypwd;///<是否有支付密码

@property (nonatomic,assign) BOOL haveHand;///<是否有手势密码

@property (nonatomic,assign) BOOL is_loginOrRegister;///<是登录还是注册

@property (nonatomic,assign) BOOL isopen_hand;///<是登录还是注册

@end
