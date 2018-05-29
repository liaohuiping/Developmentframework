//
//  DNDictionaryString.m
//  HotPay
//
//  Created by yangjiu on 2018/3/10.
//  Copyright © 2018年 dotnar. All rights reserved.
//

#import "DNDictionaryString.h"
#import <CommonCrypto/CommonDigest.h>

@implementation DNDictionaryString
+(NSMutableString *)keyValueStringWithDict:(NSDictionary *)dict
{
    if (dict == nil) {
        return nil;
    }
    NSArray *arrPrimary = dict.allKeys;
    
    NSArray *arrKey = [arrPrimary sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        NSComparisonResult result = [obj1 compare:obj2];
        return result==NSOrderedDescending;//NSOrderedAscending 倒序
    }];
    
    NSMutableString *string = [NSMutableString stringWithString:@""];
    
    
    for (NSString *s in arrKey) {
        
        id value = [dict objectForKey:s];
        
        if([value isKindOfClass:[NSDictionary class]]) {
            
            value = [DNDictionaryString keyValueStringWithDict:value];
             LogErrorLevel(@"某个参数为字典")
        }
        [string appendFormat:@"%@=%@&",s,value];
        

    }
    if ([string rangeOfString:@"&"].length) {
            [string deleteCharactersInRange:NSMakeRange(string.length - 1, 1)];
        }
        
        
//    NSMutableString *string = [NSMutableString stringWithString:@""];
//    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//        [string appendFormat:@"%@=%@&",key,obj];
//    }];
//
//    if ([string rangeOfString:@"&"].length) {
//        [string deleteCharactersInRange:NSMakeRange(string.length - 1, 1)];
//    }
    
    return string;
}

+(NSDictionary *)dictionaryWithUrlString:(NSString *)urlStr
{
    if (urlStr && urlStr.length && [urlStr rangeOfString:@"?"].length == 1) {
        NSArray *array = [urlStr componentsSeparatedByString:@"?"];
        if (array && array.count == 2) {
            NSString *paramsStr = array[1];
            if (paramsStr.length) {
                NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
                NSArray *paramArray = [paramsStr componentsSeparatedByString:@"&"];
                for (NSString *param in paramArray) {
                    if (param && param.length) {
                        NSArray *parArr = [param componentsSeparatedByString:@"="];
                        if (parArr.count == 2) {
                            [paramsDict setObject:parArr[1] forKey:parArr[0]];
                        }
                    }
                }
                return paramsDict;
            }else{
                return nil;
            }
        }else{
            return nil;
        }
    }else{
        return nil;
    }
}

+ (NSString *)md5WithString:(NSString *)string {
    if (string == nil || [string length] == 0) {
        return nil;
    }

    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5([string UTF8String], (int)[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];

    for (i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ms appendFormat:@"%02x", (int)(digest[i])];
    }

    return [ms copy];
}

//+ (NSString *) md5WithString:(NSString *) str
//{
//    const char *cStr = [str UTF8String];
//    unsigned char result[16];
//    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
//    return [NSString stringWithFormat:
//            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
//            result[0], result[1], result[2], result[3],
//            result[4], result[5], result[6], result[7],
//            result[8], result[9], result[10], result[11],
//            result[12], result[13], result[14], result[15]
//            ];
//}


@end
