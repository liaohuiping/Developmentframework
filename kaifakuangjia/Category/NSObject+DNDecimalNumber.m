//
//  NSObject+DNDecimalNumber.m
//  WheatField
//
//  Created by dotnar on 2017/7/20.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "NSObject+DNDecimalNumber.h"

@implementation NSObject (DNDecimalNumber)
+(NSNumber*)numberToDecimalNumberWithNumber:(NSString *)numberString{
    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                       
                                       decimalNumberHandlerWithRoundingMode:NSRoundBankers
                                       
                                       scale:2
                                       
                                       raiseOnExactness:NO
                                       
                                       raiseOnOverflow:NO
                                       
                                       raiseOnUnderflow:NO
                                       
                                       raiseOnDivideByZero:YES];
    NSDecimalNumber *realNumber = [[NSDecimalNumber decimalNumberWithString:numberString] decimalNumberByAdding:[NSDecimalNumber decimalNumberWithString:@"0"] withBehavior:roundUp];
    return realNumber;
}
@end
