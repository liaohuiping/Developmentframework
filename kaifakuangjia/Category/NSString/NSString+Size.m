//
//  NSString+Size.m
//  WheatField
//
//  Created by dotnar on 2017/5/18.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)
//返回字符串所占用的尺寸.
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
@end
