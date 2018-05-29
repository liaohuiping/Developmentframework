//
//  DNLoginVMC.m
//  kaifakuangjia
//
//  Created by lhp on 2018/5/28.
//  Copyright © 2018年 lhp. All rights reserved.
//

#import "DNLoginVMC.h"
#import "DNUserModel.h"

@implementation DNLoginVMC
-(void)loginWithUserModel:(DNUserModel*)userModel{
    NSDictionary* params = @{kNetParamsKeyUser_id:@""};
    
    [DNNetRequest postWithUrl:[DNNetURL loginUrl] refreshCache:NO params:params WithReturnValeuBlock:^(id returnValue) {
        [self fetchValueSuccessWithResponse:returnValue];
    } WithErrorCodeBlock:^(id errorCode) {
        [self errorCodeWithReponse:errorCode];
    } WithFailureBlock:^(NSError *netError) {
        [self netFailureWithError:netError];
    }];
}
#pragma 获取到正确的数据，对正确的数据进行处理
-(void)fetchValueSuccessWithResponse: (DNResponseModel*) returnValue{
    if (self.returnBlock) {
        DNUserModel* userModel = [DNUserModel mj_objectWithKeyValues:returnValue.data];
        userModel.msg = returnValue.msg;
        self.returnBlock(userModel);
    }
}
@end
