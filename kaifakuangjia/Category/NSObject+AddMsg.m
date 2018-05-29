//
//  NSObject+AddMsg.m
//  HotPay
//
//  Created by yangjiu on 2018/3/10.
//  Copyright © 2018年 dotnar. All rights reserved.
//

#import "NSObject+AddMsg.h"

static NSString *_msg;

@implementation NSObject (AddMsg)
- (void)setMsg:(NSString *)msg{
    objc_setAssociatedObject(self, &_msg, msg, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSString *)msg{
    return objc_getAssociatedObject(self, &_msg);
}
@end
