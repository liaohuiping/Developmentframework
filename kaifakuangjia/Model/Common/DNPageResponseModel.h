//
//  DNPageResponseModel.h
//  WheatField
//
//  Created by dotnar on 2017/6/19.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNPageModel.h"

@interface DNPageResponseModel : NSObject

@property (nonatomic,strong) DNPageModel* pagesMsg;
@property (nonatomic,strong) NSArray* info;

@end
