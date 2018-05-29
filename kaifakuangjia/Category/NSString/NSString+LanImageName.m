//
//  NSString+LanImageName.m
//  WheatField
//
//  Created by dotnar on 2017/7/29.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "NSString+LanImageName.h"

@implementation NSString (LanImageName)
+ (NSString *)getLanPicNameWithPicName:(NSString *)picName{
    if (KLanguageChinese)
        
    {
        return [NSString stringWithFormat:@"%@",picName];
        
    }
    else{
        return [NSString stringWithFormat:@"%@_en",picName];
    }
}
@end
