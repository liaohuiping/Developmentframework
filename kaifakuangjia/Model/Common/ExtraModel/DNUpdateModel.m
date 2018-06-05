//
//  DNUpdateModel.m
//  WheatField
//
//  Created by dotnar on 2017/7/1.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNUpdateModel.h"

@implementation DNUpdateModel
+(NSDictionary*)mj_replacedKeyFromPropertyName{
    return @{@"appSize":@"versionSize",@"updateContent":@"functionDesc",@"isMust":@"isForce",@"isCheck":@"isOpen"};
}
-(void)setVersion:(NSString *)version{
    _version = version;
    self.showVersion = [NSString stringWithFormat:@"V%@",version];
}
 
-(void)setAppSize:(NSString *)appSize{
    _appSize = appSize;
    self.showAppSize = [NSString stringWithFormat:@"%@",appSize];
}
@end
