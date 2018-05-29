//
//  DNDateFormatter.m
//  WheatField
//
//  Created by dotnar on 2017/5/13.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNDateFormatter.h"

@implementation DNDateFormatter
+(NSString*)transformDate:(NSDate *)date withFormatter:(NSString *)formatterStr{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = formatterStr;
    NSString* timeString = [dateFormatter stringFromDate:date];
    return timeString;
}

+(NSDate*)transformString:(NSString *)string withFormatter:(NSString *)formatterStr{
    if (string.length != formatterStr.length) {
        LogErrorLevel(@"需要转换的格式不正确");
        return [NSDate date];
    }
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = formatterStr;
    NSDate* timeDate = [dateFormatter dateFromString:string];
    return timeDate;
}

+(NSString*)calculateWeekDayHourMinuteSecondWithTimeInterval:(NSTimeInterval)interval
{
    NSInteger week = interval /(7*24*60*60);
    NSInteger day = ((NSInteger)interval%(7*24*60*60))/(24*60*60);
    NSInteger hour = ((NSInteger)interval%(24*60*60))/(60*60);
    NSInteger minute = ((NSInteger)interval%(60*60))/60;
    NSInteger second = (NSInteger)interval%60;
    if (KLanguageChinese) {
      return [NSString stringWithFormat:@"%02ld周%02ld天%02ld时%02ld分%02ld秒",(long)week,(long)day,(long)hour,(long)minute,(long)second];
    }
    else if ([[kUserDefaults objectForKey:kUserDefaults_StringAppLanguage] isEqualToString:@"en"]){
        return [NSString stringWithFormat:@"%02ld%@%02ld%@%02ld%@ %02ld%@ %02ld%@",(long)hour,Localized(kText_Hour),(long)minute,Localized(kText_Minute),(long)second,Localized(kText_Second),(long)day,Localized(kText_Day),(long)week,Localized(kText_Week)];
    }
    else{
        return [NSString stringWithFormat:@"%02ld%@%02ld%@%02ld%@ %02ld%@ %02ld%@",(long)hour,Localized(kText_Hour),(long)minute,Localized(kText_Minute),(long)second,Localized(kText_Second),(long)day,Localized(kText_Day),(long)week,Localized(kText_Week)];
    }
}

+(NSString*)calculateHourMinuteSecondWithTimeInterval:(NSTimeInterval)interval
{
    NSInteger hour = ((NSInteger)interval%(24*60*60))/(60*60);
    NSInteger minute = ((NSInteger)interval%(60*60))/60;
    NSInteger second = (NSInteger)interval%60;
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",(long)hour,(long)minute,(long)second];
}


+(NSString*)calculateDayHourMinuteSecondWithTimeInterval:(NSTimeInterval)interval
{
    NSInteger day = ((NSInteger)interval%(7*24*60*60))/(24*60*60);
    NSInteger hour = ((NSInteger)interval%(24*60*60))/(60*60);
    NSInteger minute = ((NSInteger)interval%(60*60))/60;
    NSInteger second = (NSInteger)interval%60;
    return [NSString stringWithFormat:@"%ld%@%02ld:%02ld:%02ld",(long)day,Localized(kText_Day),(long)hour,(long)minute,(long)second];
}
@end
