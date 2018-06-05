//
//  DNNetServerModel.m
//  WheatField
//
//  Created by yangjiu on 2018/1/30.
//  Copyright © 2018年 dotnar. All rights reserved.
//

#import "DNNetServerModel.h"

@implementation DNNetServerModel
+(NSDictionary*)mj_replacedKeyFromPropertyName{
    return @{@"netDesStr":@"des",@"type":@"type",@"netBase":@"net",@"makeysBase":@"makeys_base",@"emailBase":@"email_base",@"forceBase":@"force_base"};
}

@end
