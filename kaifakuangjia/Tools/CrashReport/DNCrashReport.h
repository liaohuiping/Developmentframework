//
//  DNCrashReport.h
//  WheatField
//
//  Created by dotnar on 2017/5/2.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>
//后期添加bugly
@interface DNCrashReport : NSObject
/*!
 *
 *  @brief 异常捕捉功能
 *
 *  @param exception 异常
 *  @param className 类
 *  @param line      行
 *  @param funcation 函数
 */
+(void)insertCrashReport:(NSException *)exception Class:(Class)className Line:(NSInteger)line funcation:(NSString *)funcation;

/*!
 *
 *  @brief 错误捕捉功能
 *
 *  @param error     错误
 *  @param className 类
 *  @param line      行
 *  @param funcation 函数
 */
+(void)insertErrorReport:(NSError *)error Class:(Class)className Line:(NSInteger)line funcation:(NSString *)funcation;

/*!
 *
 *  @brief 捕捉后台问题的错误提交到C#错误
 *
 *  @param exception 错误类型
 *  @param className 类
 *  @param line      行
 *  @param funcation 函数
 *  @param userInfo  请求内容
 */
+(void)insertBackReport:(NSException *)exception Class:(Class)className Line:(NSInteger)line funcation:(NSString *)funcation;


@end
