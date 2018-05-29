//
//  DNResponseModel.m
//  WheatField
//
//  Created by dotnar on 2017/6/16.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNResponseModel.h"

@implementation DNResponseModel

-(BOOL)isSuccess{
    if ([self.code isEqualToString:kText_ResponeCodeSuccess]&&[self.opt isEqualToString:kText_ResponeOptSuccess]  ) {
        return YES;
    }
    else{
        return NO;
    }
}



@end
