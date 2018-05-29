//
//  DNPageModel.m
//  HotPay
//
//  Created by yangjiu on 2018/3/20.
//  Copyright © 2018年 dotnar. All rights reserved.
//

#import "DNPageModel.h"

@implementation DNPageModel
+(NSDictionary*)mj_replacedKeyFromPropertyName{
    return @{@"pageLimit":@"limit",@"allCount":@"count"};
}

-(BOOL)loadFinished{
    if (self.page*self.pageLimit >= self.allCount ) {
        return YES;
    }
    else{
        return NO;
    }
}
@end
