//
//  UIView+AddShadowLayer.m
//  WheatField
//
//  Created by dotnar on 2017/8/24.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "UIView+AddShadowLayer.h"

@implementation UIView (AddShadowLayer)
-(void)addShadowLayerWithTop:(CGFloat)top left:(CGFloat)left right:(CGFloat)right bottom:(CGFloat)bottom color:(UIColor*)shadowColor shadowOpacity:(CGFloat)apha shadowRadius:(CGFloat)radius{
    CGFloat viewHeight = self.frame.size.height;
    CGFloat viewWidth = self.frame.size.width;
    //路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];

    [path moveToPoint:CGPointMake(-left, -top)];
    //添加直线
    [path addLineToPoint:CGPointMake(+viewWidth+right,-top)];
    [path addLineToPoint:CGPointMake(+viewWidth+right,+viewHeight+bottom)];
    [path addLineToPoint:CGPointMake(-left,+viewHeight+bottom)];
    [path addLineToPoint:CGPointMake(-left,-top)];
    //设置阴影路径

    self.layer .shadowPath = path.CGPath;
    self.layer .shadowOpacity = apha;
    self.layer .shadowRadius = radius;
    self.layer.shadowColor = shadowColor.CGColor;

}

-(void)addLayerRadius:(CGFloat)radius{
    CALayer* radiusLayer = [[CALayer alloc]init];
    radiusLayer.bounds = self.bounds;
    radiusLayer.position = self.frame.origin;
    radiusLayer.cornerRadius = radius;
    radiusLayer.masksToBounds = YES;
    radiusLayer.zPosition = 1;
    [self.layer addSublayer:radiusLayer];
}

-(void)addShadowRadius:(CGFloat)radius color:(UIColor*)shadowColor shadowOpacity:(CGFloat)apha shadowOffset:(CGSize)offset{
    //路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame)/2.0) radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    //设置阴影路径
    self.layer.shadowOffset = offset;
    self.layer .shadowPath = path.CGPath;
    self.layer .shadowOpacity = apha;
    self.layer.shadowColor = shadowColor.CGColor;
}
@end
