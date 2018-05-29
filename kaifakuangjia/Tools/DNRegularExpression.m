//
//  DNRegularExpression.m
//  WheatField
//
//  Created by dotnar on 2017/8/1.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNRegularExpression.h"

static NSString* const KRegular_NumberLatterSpecial6To16 = @"^[0-9a-zA-Z_#]{6,16}$";

@implementation DNRegularExpression
+(BOOL)judgeNumberLatterSpecial6To16WithString:(NSString *)string{
    if (string.length >= 6&& string.length<=16) {
        return YES;
    }
    else{
        return NO;
    }

    return YES;
}

+(BOOL)judeString:(NSString*)string withRegularExpression:(NSString*)regularString{
    NSError *error;
    // 创建NSRegularExpression对象并指定正则表达式
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:regularString
                                  options:0
                                  error:&error];
    if (!error) { // 如果没有错误
        NSArray *matches = [regex matchesInString:string
                                            options:0
                                              range:NSMakeRange(0, string.length)];
        if (kArrayIsEmpty(matches)) {
            return NO;
        }
        else{
            return YES;
        }
    } else { // 如果有错误，则把错误打印出来
        LogErrorLevel(@"Regular error - %@", error);
        return YES;
    }
}
@end
