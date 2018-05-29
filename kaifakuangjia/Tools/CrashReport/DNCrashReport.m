//
//  DNCrashReport.m
//  WheatField
//
//  Created by dotnar on 2017/5/2.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNCrashReport.h"

@implementation DNCrashReport
+(void)insertCrashReport:(NSException *)exception Class:(Class)className Line:(NSInteger)line funcation:(NSString *)funcation;
{
    DDLogError(@"******\nexception:%@\nfuncation:%@\nline:%ld\n******",exception,funcation,(long)line);
//    [Bugly reportException:[NSException exceptionWithName:[NSString stringWithFormat:@"%@-%@",exception.name,funcation] reason:[NSString stringWithFormat:@"%@-%@-%@-%@",exception.name,exception.callStackReturnAddresses,exception.userInfo,funcation] userInfo:nil]];
//    XZCrashReporModel *crashReportModel=[XZCrashReporModel new];
//    crashReportModel.className=NSStringFromClass(className);
//    crashReportModel.reason=exception.reason;
//    crashReportModel.line=[NSString stringWithFormat:@"%ld",(long)line];
//    crashReportModel.otherInfo=[NSString stringWithFormat:@"%@-%@-%@-%@",exception.name,exception.callStackReturnAddresses,exception.userInfo,funcation];
//    [[DynamicSqliteSingleInstance sharedSingleInstance]insertCrashReport:@[crashReportModel]];
}


+(void)insertErrorReport:(NSError *)error Class:(Class)className Line:(NSInteger)line funcation:(NSString *)funcation;
{
    DDLogError(@"******\nerror:%@\nfuncation:%@\nline:%ld\n******",error.description,funcation,(long)line);
    
    NSMutableDictionary *tempDic=[NSMutableDictionary dictionaryWithDictionary:error.userInfo];
    [tempDic setObject:NSStringFromClass(className) forKey:@"className"];
    [tempDic setObject:[NSString stringWithFormat:@"%ld",(long)line] forKey:@"line"];
    [tempDic setObject:funcation forKey:@"funcation"];
//    NSError *errorT=[NSError errorWithDomain:error.domain code:error.code userInfo:tempDic];
//    [Bugly reportError:errorT];
//    XZCrashReporModel *crashReportModel=[XZCrashReporModel new];
//    crashReportModel.className=NSStringFromClass(className);
//    crashReportModel.reason=error.localizedDescription;
//    crashReportModel.line=[NSString stringWithFormat:@"%ld",(long)line];
//    crashReportModel.otherInfo=[NSString stringWithFormat:@"%ld-%@-%@-%@",(long)error.code,error.domain,error.userInfo,funcation];
//    [[DynamicSqliteSingleInstance sharedSingleInstance]insertCrashReport:@[crashReportModel]];
    
}

+(void)insertBackReport:(NSException *)exception Class:(Class)className Line:(NSInteger)line funcation:(NSString *)funcation
{
//    [Bugly reportExceptionWithCategory:4 name:[NSString stringWithFormat:@"%@:%@",exception.name,exception.reason] reason:[NSString stringWithFormat:@"%@",exception.userInfo] callStack:@[] extraInfo:@{} terminateApp:NO];
}


@end
