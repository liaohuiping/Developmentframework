//
//  DNDateFormatter.h
//  WheatField
//
//  Created by dotnar on 2017/5/13.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNDateFormatter : NSObject
/**
 *  @author Justin, 17-05-13 11:05:45
 *
 *   根据时间格式将date转化为string
 *
 *  @param date         需要转换的date
 *  @param formatterStr 转换的格式
 *
 *  @return 转换后的string时间
 */
+(NSString*)transformDate:(NSDate*)date withFormatter:(NSString*)formatterStr;
/**
 *  @author Justin, 17-05-13 11:05:00
 *
 *  根据时间格式将string转换为成date
 *
 *  @param string       需要转换的string
 *  @param formatterStr 转换的格式
 *
 *  @return 转换后date
 */
+(NSDate*)transformString:(NSString*)string withFormatter:(NSString*)formatterStr;
/**
 *  @author Justin, 17-05-13 11:05:54
 *
 *  根据时间间隔计算当前时间 *周*天*时*分*秒
 *
 *  @param interval 时间间隔
 *
 *  @return 计算出来的周天时分秒
 */

+(NSString*)calculateWeekDayHourMinuteSecondWithTimeInterval:(NSTimeInterval)interval;

+(NSString*)calculateHourMinuteSecondWithTimeInterval:(NSTimeInterval)interval;

+(NSString*)calculateDayHourMinuteSecondWithTimeInterval:(NSTimeInterval)interval;
@end
