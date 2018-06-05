//
//  DNUpdateModel.h
//  WheatField
//
//  Created by dotnar on 2017/7/1.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNUpdateModel : NSObject
@property (nonatomic,strong) NSString* version;///<最新的版本
@property (nonatomic,strong) NSString* appSize;///<app大小
@property (nonatomic,strong) NSString* updateContent;///<更新内容
@property (nonatomic,assign) BOOL isMust;///<是否强制更新
@property (nonatomic,assign) BOOL isUpdate;///<是否需要更新（苹果审核的时候设置为NO避免检测更新）

@property (nonatomic,assign) BOOL isCheck;///<审核状态 0不审核 1审核

@property (nonatomic,strong) NSString* showVersion;
@property (nonatomic,strong) NSString* showAppSize;
@end
