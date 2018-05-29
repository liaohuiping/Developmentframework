//
//  DNDictionaryString.h
//  HotPay
//
//  Created by yangjiu on 2018/3/10.
//  Copyright © 2018年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNDictionaryString : NSObject
+(NSMutableString *)keyValueStringWithDict:(NSDictionary *)dict;

+(NSDictionary *)dictionaryWithUrlString:(NSString *)urlStr;

+ (NSString *)md5WithString:(NSString *)string;
@end
