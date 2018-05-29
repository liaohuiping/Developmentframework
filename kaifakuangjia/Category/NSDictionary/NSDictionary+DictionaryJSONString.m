//
//  NSDictionary+DictionaryJSONString.m
//  AllDemo
//
//  Created by yangjiu on 2017/4/27.
//  Copyright © 2017年 yangjiu. All rights reserved.
//

#import "NSDictionary+DictionaryJSONString.h"
#import <objc/runtime.h>
@implementation NSDictionary (DictionaryJSONString)

+(NSString *)NSDictionaryToJSONString:(NSDictionary *)dic
{
    NSError *error = nil;
    NSData *dictData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
    
    NSString *jsonString;
    if (error == nil) {
        jsonString = [[NSString alloc] initWithData:dictData encoding:NSUTF8StringEncoding];
    }
    else {
        LogErrorLevel(@"Error creating JSON string: %@", error);
    }
    
    return jsonString;
}

- (NSString *)localizedString
{
    NSString *string = nil;
    for (NSString *language in [NSLocale preferredLanguages]) {
        string = [self valueForKey:language];
        if (string) return string;
    }
    return [[self allValues] lastObject];
}


-(NSString*) jsonEncodedKeyValueString {
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:0 // non-pretty printing
                                                     error:&error];
    if(error)
    {
        
    }
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}


-(NSString*) plistEncodedKeyValueString {
    
    NSError *error = nil;
    NSData *data = [NSPropertyListSerialization dataWithPropertyList:self
                                                              format:NSPropertyListXMLFormat_v1_0
                                                             options:0 error:&error];
    if(error)
    {
        
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}


+ (NSDictionary *)dictionaryWithNSObject:(id)object
{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([object class], &count);
    NSMutableArray *propertyArr = [NSMutableArray array];
    
    for (int i = 0; i < count; i ++) {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        [propertyArr addObject:name];
    }
    
    free(properties);
    
    __weak NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    [propertyArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        id value = [object valueForKey:obj];
        
        if (value) {
            [dictionary setObject:value forKey:obj];
        }
    }];
    
    return dictionary;
}

- (NSString *) formatForHTTP
{
    return [self formatForHTTPUsingEncoding:NSASCIIStringEncoding];
}

- (NSString *) formatForHTTPUsingEncoding:(NSStringEncoding)inEncoding
{
    return [self formatForHTTPUsingEncoding:inEncoding ordering:nil];
}

- (NSString *) formatForHTTPUsingEncoding:(NSStringEncoding)inEncoding ordering:(NSArray *)inOrdering
{
    NSMutableString *s = [NSMutableString stringWithCapacity:256];
    NSEnumerator *e = (nil == inOrdering) ? [self keyEnumerator] : [inOrdering objectEnumerator];
    CFStringEncoding cfStrEnc = CFStringConvertNSStringEncodingToEncoding(inEncoding);
    
    for (id key in e)
    {
        id keyObject = [self objectForKey: key];
        // conform with rfc 1738 3.3, also escape URL-like characters that might be in the parameters
        NSString *escapedKey
        = (__bridge  NSString *) CFURLCreateStringByAddingPercentEscapes(
                                                                         NULL, (CFStringRef) key, NULL, (CFStringRef) @";:@&=/+", cfStrEnc);
        if ([keyObject respondsToSelector: @selector(objectEnumerator)])
        {
            for (id	aValue in [keyObject objectEnumerator])
            {
                NSString *escapedObject
                = (__bridge  NSString *) CFURLCreateStringByAddingPercentEscapes(
                                                                                 NULL, (CFStringRef) [aValue description], NULL, (CFStringRef) @";:@&=/+", cfStrEnc);
                [s appendFormat:@"%@=%@&", escapedKey, escapedObject];
                escapedObject = 0;
            }
        }
        else
        {
            NSString *escapedObject
            = (__bridge  NSString *) CFURLCreateStringByAddingPercentEscapes(
                                                                             NULL, (CFStringRef) [keyObject description], NULL, (CFStringRef) @";:@&=/+", cfStrEnc);
            [s appendFormat:@"%@=%@&", escapedKey, escapedObject];
            escapedObject = 0;
        }
        escapedKey = 0;
    }
    // Delete final & from the string
    if (![s isEqualToString:@""])
    {
        [s deleteCharactersInRange:NSMakeRange([s length]-1, 1)];
    }
    return s;
}

-(NSDictionary*)allKeytoLowerCase{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:self.count];
    NSEnumerator *keyenum = self.keyEnumerator;
    @autoreleasepool {
        for(NSString  *k  in  keyenum)  {
            @autoreleasepool {
                [dict setObject:[self objectForKey:k] forKey:k.lowercaseString];
            }
        }
    }
    return dict;
}
@end
