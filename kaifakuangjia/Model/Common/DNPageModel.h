//
//  DNPageModel.h
//  HotPay
//
//  Created by yangjiu on 2018/3/20.
//  Copyright © 2018年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNPageModel : NSObject
@property (nonatomic,assign) NSInteger page;
@property (nonatomic,assign) NSInteger pageLimit;
@property (nonatomic,assign) NSInteger allCount;//总条数
@property (nonatomic,assign) BOOL loadFinished;//是否加载完成
@end
