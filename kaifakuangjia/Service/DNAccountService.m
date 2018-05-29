//
//  DNAccountService.m
//  WheatField
//
//  Created by dotnar on 2017/6/26.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNAccountService.h"
#import "DNUserModel.h"
#import "DNUpdateModel.h"
#import "DNNetServerModel.h"

static dispatch_once_t pred = 0;

static DNAccountService *singletonInstance = nil;

@interface DNAccountService ()
@property(nonatomic,strong,readwrite) DNUserModel* userModel;
@property(nonatomic,strong,readwrite) DNUpdateModel* updateModel;
@property (nonatomic,strong,readwrite) DNNetServerModel* netServerModel;

@property (nonatomic,strong,readwrite) NSArray* netServerArr;

@property (nonatomic,strong,readwrite) DNUserTradeInfoModel* tradeInfoModel;

@end

@implementation DNAccountService

-(DNNetServerModel *)netServerModel{
    if (!_netServerModel) {
        //已经设定好了地址 则 取以前的地址即可
        if (!kObjectIsEmpty([kUserDefaults objectForKey:kUserDefaults_BaseUrl])) {
            NSInteger index = [[kUserDefaults objectForKey:kUserDefaults_BaseUrl] integerValue];
            _netServerModel = [self.netServerArr objectAtIndex:index];
        }
        else{
            //初始根据 安装条件 配置不同地址
#ifdef Dev
            _netServerModel = [self.netServerArr lastObject];

#elif Dis
            _netServerModel = [self.netServerArr firstObject];
            
#elif Enterprise
            _netServerModel = [self.netServerArr firstObject];
#else
            
            _netServerModel = [self.netServerArr firstObject];
#endif
        }
        
    }
    return _netServerModel;
}

-(NSArray *)netServerArr{
    if (!_netServerArr) {
        _netServerArr = [self getNetServerArrFromPlist];
    }
    return _netServerArr;
}


-(DNUserModel *)userModel{
    if (!_userModel) {
        _userModel = [[DNUserModel alloc]init];
    }
    if (!kStringIsEmpty([kUserDefaults objectForKey:kUserDefaults_Email])) {
        _userModel.email = [kUserDefaults objectForKey:kUserDefaults_Email];
    }
    if (!kStringIsEmpty([kUserDefaults objectForKey:kUserDefaults_UserId])) {
        _userModel.userId = [kUserDefaults objectForKey:kUserDefaults_UserId];
    }
    if (!kStringIsEmpty([kUserDefaults objectForKey:kUserDefaults_HeadImageFile])) {
        _userModel.headImageFile = [kUserDefaults objectForKey:kUserDefaults_HeadImageFile];
    }
    if (!kStringIsEmpty([kUserDefaults objectForKey:kUserDefaults_LoginPassword])) {
        _userModel.password = [kUserDefaults objectForKey:kUserDefaults_LoginPassword];
    }
    if (!kStringIsEmpty([kUserDefaults objectForKey:kUserDefaults_Nickname])) {
        _userModel.nickname = [kUserDefaults objectForKey:kUserDefaults_Nickname];
    }
    if (!kStringIsEmpty([kUserDefaults objectForKey:kUserDefaults_Phone])) {
        _userModel.phone = [kUserDefaults objectForKey:kUserDefaults_Phone];
    }
    if (!kStringIsEmpty([kUserDefaults objectForKey:kUserDefaults_CountryType])) {
        _userModel.countryType = [kUserDefaults objectForKey:kUserDefaults_CountryType];
    }
    return _userModel;
}

-(DNUpdateModel *)updateModel{
    if (!_updateModel) {
        _updateModel = [[DNUpdateModel alloc]init];
    }
    return _updateModel;
}


+ (id)sharedSingleInstance
{
    dispatch_once(&pred, ^{
        singletonInstance = [[super allocWithZone:NULL] init];
    });
    
    return singletonInstance;
}

-(void)updateUserModel:(DNUserModel *)userModel{
    self.userModel = userModel;
}
-(void)removeUserModel{
    self.userModel = nil;
}
-(void)updateAppUpdateModle:(DNUpdateModel *)updateModel{
    self.updateModel = updateModel;
}

-(void)updateNetServerModel:(DNNetServerModel *)netServerModel{
    self.netServerModel = netServerModel;
}

-(void)removeNetServerModel{
    self.netServerModel = nil;
}

-(NSArray*)getNetServerArrFromPlist{
    
    NSString *filePatch = [[NSBundle mainBundle] pathForResource:KFile_NetPlist ofType:nil];
    
    NSArray* arr = [NSArray arrayWithContentsOfFile:filePatch];
    
    if (kArrayIsEmpty(arr)) {
        LogErrorLevel(@"无网络数据文件");
    }
    NSArray* modelArr = [DNNetServerModel mj_objectArrayWithKeyValuesArray:arr];
    if (kArrayIsEmpty(modelArr)) {
        DNNetServerModel* netServerModel = [[DNNetServerModel alloc]init];
        netServerModel.netDesStr = @"正式环境地址";
        netServerModel.type = @0;
        netServerModel.netBase = @"http://192.168.2.103:8038/";
        netServerModel.makeysBase = @"http://makeys.qeveworld.com/";
        netServerModel.emailBase = @"http://www.qeveworld.com/";
        netServerModel.forceBase = @"http://www.force-center.com/";
        modelArr = @[netServerModel];
    }
    return modelArr;
}
-(void)updateUserTradeInfoModel:(DNUserTradeInfoModel *)tradeInfoModel{
    _tradeInfoModel = tradeInfoModel;
}

-(void)removeUserTradeInfoModel{
    self.tradeInfoModel = nil;
}
@end
