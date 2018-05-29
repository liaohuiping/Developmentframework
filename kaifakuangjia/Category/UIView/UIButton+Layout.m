//
//  UIButton+Layout.m
//  WheatField
//
//  Created by dotnar on 2017/6/2.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "UIButton+Layout.h"
#import "NSString+Size.h"
@implementation UIButton (Layout)
- (void)verticalImageAndTitle:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font maxSize:CGSizeMake(MAXFLOAT,20)];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
    
}

-(void)horizontalLeftImageRightTitleWithSpace:(CGFloat)spacing{

    self.imageEdgeInsets = UIEdgeInsetsMake(0,-spacing/2.0, 0,0);
    self.titleEdgeInsets = UIEdgeInsetsMake(0,spacing/2.0, 0,0);;
}
@end
