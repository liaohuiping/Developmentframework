//
//  DNResponseModel.h
//  WheatField
//
//  Created by dotnar on 2017/6/16.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNResponseModel : NSObject
@property (nonatomic,copy) id data;
@property (nonatomic,copy) NSString* msg;
@property (nonatomic,copy) NSString* code;
@property (nonatomic,copy) NSString* opt;

@property (nonatomic,assign) BOOL isSuccess;
@end
