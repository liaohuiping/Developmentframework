//
//  DNLanSize.m
//  WheatField
//
//  Created by dotnar on 2017/7/29.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNLanSize.h"

@implementation DNLanSize
+(CGFloat)addSizeOriginal:(CGFloat)originalSize andAddSize:(CGFloat)addSize{
    if (KLanguageChinese) {
        return  originalSize;
    }
    else{
        return originalSize+addSize;
    }
}
@end
