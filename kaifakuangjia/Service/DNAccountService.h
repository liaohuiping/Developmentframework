//
//  DNAccountService.h
//  WheatField
//
//  Created by dotnar on 2017/6/26.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DNUserModel;
@class DNUpdateModel;
@class DNNetServerModel;
@class DNUserTradeInfoModel;

@interface DNAccountService : NSObject

@property(nonatomic,strong,readonly) DNUserModel* userModel;

@property(nonatomic,strong,readonly) DNUpdateModel* updateModel;

@property (nonatomic,strong,readonly) DNNetServerModel* netServerModel;

@property (nonatomic,strong,readonly) NSArray* netServerArr;

@property (nonatomic,strong,readonly) DNUserTradeInfoModel* tradeInfoModel;

+(id)sharedSingleInstance;

-(void)updateUserModel:(DNUserModel *)userModel;

-(void)removeUserModel;

-(void)updateAppUpdateModle:(DNUpdateModel*)updateModel;

-(void)updateNetServerModel:(DNNetServerModel*)netServerModel;

-(void)removeNetServerModel;

-(void)updateUserTradeInfoModel:(DNUserTradeInfoModel*)tradeInfoModel;

-(void)removeUserTradeInfoModel;

@end
