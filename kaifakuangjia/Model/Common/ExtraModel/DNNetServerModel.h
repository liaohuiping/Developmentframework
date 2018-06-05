//
//  DNNetServerModel.h
//  WheatField
//
//  Created by yangjiu on 2018/1/30.
//  Copyright © 2018年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNNetServerModel : NSObject
@property (nonatomic,strong) NSString* netDesStr;
@property (nonatomic,strong) NSNumber* type;
@property (nonatomic,assign) int index;
@property (nonatomic,strong) NSString* netBase;
@property (nonatomic,strong) NSString* makeysBase;
@property (nonatomic,strong) NSString* emailBase;
@property (nonatomic,strong) NSString* forceBase;
@end
