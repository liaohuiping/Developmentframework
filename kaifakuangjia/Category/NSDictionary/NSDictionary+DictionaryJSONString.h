//
//  NSDictionary+DictionaryJSONString.h
//  AllDemo
//
//  Created by yangjiu on 2017/4/27.
//  Copyright © 2017年 yangjiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DictionaryJSONString)
+(NSString *)NSDictionaryToJSONString:(NSDictionary *)dic;

- (NSString *)localizedString;

#pragma mark - RequestEncoding
-(NSString*) jsonEncodedKeyValueString;

-(NSString*) plistEncodedKeyValueString;
#pragma mark  - ObjectToDict
+ (NSDictionary *)dictionaryWithNSObject:(id)object;

#pragma mark - HTTPExtensions

- (NSString *)formatForHTTP;

- (NSString *)formatForHTTPUsingEncoding:(NSStringEncoding)inEncoding;

- (NSString *)formatForHTTPUsingEncoding:(NSStringEncoding)inEncoding ordering:(NSArray *)inOrdering;

-(NSDictionary*)allKeytoLowerCase;//所有key小写

@end
