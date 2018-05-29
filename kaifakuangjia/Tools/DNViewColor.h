//
//  DNViewColor.h
//  WheatField
//
//  Created by dotnar on 2017/4/29.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define DEFAULT_VOID_COLOR [UIColor whiteColor]

@interface DNViewColor : NSObject
+(UIColor *)colorWithHexString:(NSString *)stringToConvert;
@end
