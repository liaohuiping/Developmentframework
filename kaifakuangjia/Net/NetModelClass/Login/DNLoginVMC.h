//
//  DNLoginVMC.h
//  kaifakuangjia
//
//  Created by lhp on 2018/5/28.
//  Copyright © 2018年 lhp. All rights reserved.
//

#import "DNViewModelClass.h"
@class DNUserModel;
@interface DNLoginVMC : DNViewModelClass
-(void)loginWithUserModel:(DNUserModel*)userModel;
@end
