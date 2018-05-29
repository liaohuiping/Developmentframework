//
//  DNUserModel.m
//  WheatField
//
//  Created by dotnar on 2017/6/16.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNUserModel.h"
#import "DNNetServerModel.h"
@implementation DNUserModel
+(NSDictionary*)mj_replacedKeyFromPropertyName{
    return @{@"userId":@"userid",@"nickname":@"nick",@"sex":@"sex",@"headImageFile":@"avatar",@"token":@"online_rfid",@"sjCode":@"sjcode",@"qrCode":@"qrCode",@"payPwdToken":@"token",@"havePaypwd":@"is_paypwd",@"haveHand":@"is_hand",@"isopen_hand":@"isopen_hand",@"countryType":@"country"};
    
}

-(void)setHeadImageFile:(NSString *)headImageFile{
    if (![headImageFile containsString:[[[DNAccountService sharedSingleInstance]netServerModel]netBase]]) {
         _headImageFile = [[[[DNAccountService sharedSingleInstance]netServerModel]netBase] stringByAppendingString:headImageFile];
    }
    else{
        _headImageFile = headImageFile;
    }
   
}


@end
