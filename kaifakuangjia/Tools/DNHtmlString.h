//
//  DNHtmlString.h
//  WheatField
//
//  Created by dotnar on 2017/8/3.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNHtmlString : NSObject
+(NSString*)htmlStringToStringWith:(NSString *)htmlString;

+(NSString*)htmlStringToNoSpaceStringWith:(NSString *)htmlString;
@end
