//
//  file_config.h
//  WheatField
//
//  Created by dotnar on 2017/6/7.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#ifndef file_config_h
#define file_config_h




#define kFileManager [NSFileManager defaultManager]

//获取沙盒路径
#define kPathHome NSHomeDirectory()

//获取沙盒 kPathTemp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
//获取bundle路径
#define kPathBundle [NSBundle mainBundle]

static NSString* const KFile_NetPlist = @"NetServer.plist";
static NSString* const kCountryPlistFile = @"Country.plist";

#endif /* file_config_h */
