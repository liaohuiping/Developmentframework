//
//  MainMoreButton.m
//  HotPay
//
//  Created by lhp on 2018/4/10.
//  Copyright © 2018年 dotnar. All rights reserved.
//

#import "MainMoreButton.h"

@implementation MainMoreButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 10;
    CGFloat imageY = 0;
    CGFloat imageW = contentRect.size.width - imageX * 2;
//    CGFloat imageH = contentRect.size.height * 0.5;
    return CGRectMake(imageX, imageY, imageW, imageW);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.height * 0.63;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height * 0.3;
    return CGRectMake(titleX, titleY, titleW, titleH);
    
}

@end
