//
//  NSObject+DNYMSkipBackup.h
//  WheatField
//
//  Created by dotnar on 2017/7/4.
//  Copyright © 2017年 dotnar. All rights reserved.
//
/*
 当前类的功能是： 禁止指定目录同步到iCloud上
 */
#import <Foundation/Foundation.h>

@interface NSObject (DNYMSkipBackup)
-(BOOL)addSkipBackupAttributeToItemAtUrl:(NSURL *)fileUrl;
@end
