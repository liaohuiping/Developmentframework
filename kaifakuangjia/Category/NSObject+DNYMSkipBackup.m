//
//  NSObject+DNYMSkipBackup.m
//  WheatField
//
//  Created by dotnar on 2017/7/4.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "NSObject+DNYMSkipBackup.h"

@implementation NSObject (DNYMSkipBackup)
-(BOOL)addSkipBackupAttributeToItemAtUrl:(NSURL *)fileUrl
{
    assert([[NSFileManager defaultManager] fileExistsAtPath:[fileUrl path] ]);
    
    NSError * error = nil;
    
    BOOL success = [fileUrl setResourceValue:[NSNumber numberWithBool:YES] forKey:NSURLIsExcludedFromBackupKey error:&error];
    if (!success) {
        LogErrorLevel(@"Error excluding %@ from backup %@",[fileUrl lastPathComponent],error);
    }
    return success;
}
@end
