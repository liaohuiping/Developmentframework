//
//  enum_config.h
//  WheatField
//
//  Created by dotnar on 2017/5/11.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#ifndef enum_config_h
#define enum_config_h



/**
 语言状态
 */
enum AppLanguage
{
    AppLanguageDefault = 0,///<默认、跟随系统
    AppLanguageChina= 1,///<中文
    AppLanguageEnglish = 2,///<英文
    AppLanguageSystem = 3 ///<跟随系统
};

typedef enum AppLanguage AppLanguage;


/**
 性别
 */
enum SexType
{
    SexTypeWomen = 0,
    SexTypeMan = 1
};

typedef enum SexType SexType;



enum AppRunType
{
    AppRunTypeDis = 1,///<正式
    AppRunTypeCheck = 2,///<测试
    AppRunTypeDev = 3,///<开发
    AppRunTypeLSBDev = 4,///<刘盛波
    AppRunTypeFirimCheck = 5,///<firim测试，带firim更新正式环境测试
    AppRunTypeDisPhilippine = 6,///<菲律宾正式服务
    AppRunTypeEnterprise = 7///<企业版
};

typedef enum AppRunType AppRunType;

enum CoreLockType{
    
    //设置密码
    CoreLockTypeSetPwd=0,
    
    //输入并验证密码
    CoreLockTypeVeryfiPwd = 1,
    
    //修改密码
    CoreLockTypeModifyPwd = 2,
    
};
typedef enum CoreLockType CoreLockType;

#endif /* enum_config_h */
