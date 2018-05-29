//
//  tool_config.h
//  WheatField
//
//  Created by dotnar on 2017/4/29.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#ifndef tool_config_h
#define tool_config_h
#import <Bugly/BuglyLog.h>



#pragma mark - tool
/**
 *  is ios7 or not
 *
 *  @param bounds].size.height bounds].size.height description
 *
 *  @return return value description
 */
#define kIOS7Plus [[[UIDevice currentDevice]systemVersion]floatValue]>=7.0

#define kIOS8Under [[[UIDevice currentDevice]systemVersion]floatValue]<8.0
#define kIOS11Under [[[UIDevice currentDevice]systemVersion]floatValue]<11.0
#define kIOS11 [[[UIDevice currentDevice]systemVersion]floatValue] >= 11.0
/**
 *  Screen types defined
 *
 *  @param bounds].size.height bounds].size.height description
 *
 *  @return return Is that a screen sizes Boolean value
 */

#define SCREENH (([[UIScreen mainScreen] bounds].size.height == 812) ? ([UIScreen mainScreen].bounds.size.height - 88):([UIScreen mainScreen].bounds.size.height - 64))
#define TarbarHeight (([[UIScreen mainScreen] bounds].size.height == 812) ? 83:49)
#define IS_IPHONE_X ([[UIScreen mainScreen] bounds].size.height == 812)

#define NAVCHEIGHT (([[UIScreen mainScreen] bounds].size.height == 812) ? 88:64)

#define WG(W) ([UIScreen mainScreen].bounds.size.height / 667 * W)
#define WH(W) (([[UIScreen mainScreen] bounds].size.height == 812) ? ([UIScreen mainScreen].bounds.size.height / 812) * W:([UIScreen mainScreen].bounds.size.height / 667) * W)

#define kIPhone35inch ([[UIScreen mainScreen] bounds].size.height == 480)
#define kIPhone4inch ([[UIScreen mainScreen] bounds].size.height == 568)
#define kIPhone47inch ([[UIScreen mainScreen] bounds].size.height == 667)
#define kIPhone55inch ([[UIScreen mainScreen] bounds].size.height == 736)

#define kIPhoneXinch ([[UIScreen mainScreen] bounds].size.height == 812)

#define kSceenHeight  ((CGFloat)[UIScreen mainScreen].bounds.size.height)
#define kSceenWidth   [UIScreen mainScreen].bounds.size.width
#define kSceenSize  [UIScreen mainScreen].bounds.size

/**
 *  operation
 */

#define kCacehFileName(x) [[DocumentPaths objectAtIndex:0]stringByAppendingPathComponent:x]
#define ImageName(obj) [UIImage imageNamed:obj]


#define CrashReportShow [CrashReport insertCrashReport:exception Class:[self class] Line:__LINE__  funcation:[NSString stringWithCString:__PRETTY_FUNCTION__ encoding:NSUTF8StringEncoding]];

/**
 *
 */
//空字符串
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//空数组
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//空字典
 #define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))
//应用
#define kApplication        [UIApplication sharedApplication]
//键盘
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
//appdelegate
#define kAppDelegate        [UIApplication sharedApplication].delegate
//获取userdefault
#define kUserDefaults      [NSUserDefaults standardUserDefaults]
//获取notificationCenter
#define kNotificationCenter [NSNotificationCenter defaultCenter]
//当前app版本
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//当前系统版本
#define kSystemVersion [[UIDevice currentDevice] systemVersion]
//当前语言
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
#define KLanguageChinese [[kUserDefaults objectForKey:kUserDefaults_StringAppLanguage]isEqualToString:@"zh-Hans"]
//iphone设备
#define kISiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
// ipad设备
#define kISiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
// ipod设备
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

//随机颜色
#define kDNRandomColor  [UIColor colorWithRed: arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue: arc4random_uniform(255)/255.0 alpha: 1]
//255颜色
#define kDNRGBAColor(r,g,b,a)   [UIColor colorWithRed: r/255.0 green:g/255.0 blue: b/255.0 alpha: a]
//1颜色
#define kDNRGBColor(r,g,b) kDNRGBAColor(r,g,b,1)
/** 16进制颜色 0xffffff */
#define kDNColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define LogErrorLevel(frmt, ...) DDLogError((@"" @"[error]--\n" frmt @"\n(func:%s)"), ##__VA_ARGS__,__FUNCTION__);BLYLogError((frmt @"\n(func:%s)"), ##__VA_ARGS__,__FUNCTION__);


#define LogWarnLevel(frmt, ...) DDLogWarn((@"" @"[warning]--\n" frmt @"\n(func:%s)"), ##__VA_ARGS__,__FUNCTION__);BLYLogWarn((frmt @"\n(func:%s)"), ##__VA_ARGS__,__FUNCTION__);

#define LogInfoLevel(frmt, ...) DDLogInfo((@"" @"[info]--\n" frmt @"\n(func:%s)"), ##__VA_ARGS__,__FUNCTION__);BLYLogInfo((frmt @"\n(func:%s)"), ##__VA_ARGS__,__FUNCTION__);

#define LogDebugLevel(frmt, ...) DDLogDebug((@"" @"[debug]--\n" frmt @"\n(func:%s)"), ##__VA_ARGS__,__FUNCTION__);BLYLogDebug((frmt @"\n(func:%s)"), ##__VA_ARGS__,__FUNCTION__);


#define LogVerboseLevel(frmt, ...) DDLogVerbose((@"" @"[verbose]--\n" frmt @"\n(func:%s)"), ##__VA_ARGS__,__FUNCTION__);BLYLogVerbose(frmt @"\n(func:%s)"), ##__VA_ARGS__,__FUNCTION__);


/**国际化**/
#define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaults_StringAppLanguage]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Localizable"]
/**图片国际化**/
#define LanImageStr(String) [NSString getLanPicNameWithPicName:String]
#define LanSizeCGfloat(Original,Add) [DNLanSize addSizeOriginal:Original andAddSize:Add]

/***拼接字符串***/
#define String(A,B) [A stringByAppendingString:B]
#endif /* tool_config_h */
