//
//  DNHtmlString.m
//  WheatField
//
//  Created by dotnar on 2017/8/3.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNHtmlString.h"

@implementation DNHtmlString
+(NSString*)htmlStringToStringWith:(NSString *)htmlString{
    if (kStringIsEmpty(htmlString)) {
        return @"";
    }
    NSAttributedString* attributString = [[NSAttributedString alloc]initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    NSMutableString* mutString = attributString.string.mutableCopy;
    [mutString replaceOccurrencesOfString:@"\n\n" withString:@"\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, mutString.length)];
    return mutString;
}

+(NSString*)htmlStringToNoSpaceStringWith:(NSString *)htmlString{
    if (kStringIsEmpty(htmlString)) {
        return @"";
    }
    NSAttributedString* attributString = [[NSAttributedString alloc]initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:[NSNumber numberWithInt:NSUTF8StringEncoding]} documentAttributes:nil error:nil];
    NSMutableString* mutString = attributString.string.mutableCopy;
    [mutString replaceOccurrencesOfString:@"\n" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, mutString.length)];
    [mutString replaceOccurrencesOfString:@"\r" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, mutString.length)];
    [mutString replaceOccurrencesOfString:@"\U00002028" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, mutString.length)];
    
    [mutString replaceOccurrencesOfString:@"  " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, mutString.length)];
    return mutString;
}
@end
