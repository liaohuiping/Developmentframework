//
//  UIView+AddShadowLayer.h
//  WheatField
//
//  Created by dotnar on 2017/8/24.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AddShadowLayer)
-(void)addShadowLayerWithTop:(CGFloat)top left:(CGFloat)left right:(CGFloat)right bottom:(CGFloat)bottom color:(UIColor*)shadowColor shadowOpacity:(CGFloat)apha shadowRadius:(CGFloat)radius;

-(void)addLayerRadius:(CGFloat)radius;

-(void)addShadowRadius:(CGFloat)radius color:(UIColor*)shadowColor shadowOpacity:(CGFloat)apha shadowOffset:(CGSize)offset;
@end
