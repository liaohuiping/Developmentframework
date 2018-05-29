//
//  UIView+AddLayer.m
//  WheatField
//
//  Created by dotnar on 2017/5/3.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "UIView+AddLayer.h"


#define defaultWidth kSeparateHeight
#define defaultColor kDNColorFromRGB(0Xf3f3f3)
@implementation UIView (AddLayer)
-(void)addLineWidth:(CGFloat)width withColor:(UIColor*)color inTop:(BOOL)isTop inBottom:(BOOL)isBottom{
    if (!isBottom&&!isTop) {
        return;
    }
    [self layoutIfNeeded];
    UIBezierPath * apath = [UIBezierPath bezierPath];
    if (isTop) {
        [apath moveToPoint:CGPointMake(0,0)];
        [apath addLineToPoint:CGPointMake(CGRectGetWidth(self.frame),0)];
    }
    if (isBottom) {
        [apath moveToPoint:CGPointMake(0, CGRectGetHeight(self.frame))];
        [apath addLineToPoint:CGPointMake(CGRectGetWidth(self.frame),CGRectGetHeight(self.frame))];
    }

    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    if (kObjectIsEmpty(color)) {
        shapeLayer.strokeColor = defaultColor.CGColor;
    }
    else{
        shapeLayer.strokeColor = color.CGColor;

    }
    
    if (width > 0.0) {
        shapeLayer.lineWidth = width;
    }
    else{
        shapeLayer.lineWidth = defaultWidth;
    }
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.path = apath.CGPath;
    [self.layer addSublayer:shapeLayer];
}

-(void)addLineWidth:(CGFloat)width withColor:(UIColor*)color inTop:(BOOL)isTop inBottom:(BOOL)isBottom topEdgeInsets:(UIEdgeInsets)topEdgeInsets bottomEdgeInsets:(UIEdgeInsets)bottomEdgeInsets{

    if (!isBottom&&!isTop) {
        return;
    }
    [self layoutIfNeeded];
    UIBezierPath * apath = [UIBezierPath bezierPath];
    if (isTop) {
        [apath moveToPoint:CGPointMake(topEdgeInsets.left,topEdgeInsets.top)];
        [apath addLineToPoint:CGPointMake(CGRectGetWidth(self.frame)-topEdgeInsets.right,topEdgeInsets.top)];
    }
    if (isBottom) {
        [apath moveToPoint:CGPointMake(bottomEdgeInsets.left, CGRectGetHeight(self.frame)-bottomEdgeInsets.bottom)];
        [apath addLineToPoint:CGPointMake(CGRectGetWidth(self.frame)-bottomEdgeInsets.right,CGRectGetHeight(self.frame)-bottomEdgeInsets.bottom)];
    }
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    if (kObjectIsEmpty(color)) {
        shapeLayer.strokeColor = defaultColor.CGColor;
    }
    else{
        shapeLayer.strokeColor = color.CGColor;
        
    }
    
    if (width > 0.0) {
        shapeLayer.lineWidth = width;
    }
    else{
        shapeLayer.lineWidth = defaultWidth;
    }
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.path = apath.CGPath;
    [self.layer addSublayer:shapeLayer];
}

-(void)addLineInTopAndBottom{
    [self addLineWidth:defaultWidth withColor:defaultColor inTop:YES inBottom:YES];
}
-(void)addLineInTopAndBottomWidth:(CGFloat)width{
    [self addLineWidth:width withColor:defaultColor inTop:YES inBottom:YES];
}
-(void)addLineInTopAndBottomWidth:(CGFloat)width withColor:(UIColor*)color{
    [self addLineWidth:width withColor:color inTop:YES inBottom:YES];
}

-(void)addLineInTop{
    [self addLineWidth:defaultWidth withColor:defaultColor inTop:YES inBottom:NO];
}
-(void)addLineInTopWidth:(CGFloat)width{
    [self addLineWidth:width withColor:defaultColor inTop:YES inBottom:NO];
}
-(void)addLineInTopWidth:(CGFloat)width withColor:(UIColor*)color{
    [self addLineWidth:width withColor:color inTop:YES inBottom:NO];
}

-(void)addLineInBottom{
    [self addLineWidth:defaultWidth withColor:defaultColor inTop:NO inBottom:YES];
}
-(void)addLineInBottomWidth:(CGFloat)width{
    [self addLineWidth:width withColor:defaultColor inTop:NO inBottom:YES];
}
-(void)addLineInBottomWidth:(CGFloat)width withColor:(UIColor*)color{
    [self addLineWidth:width withColor:color inTop:NO inBottom:YES];
}


-(void)addLineWidth:(CGFloat)width withColor:(UIColor*)color inLeft:(BOOL)isLeft inRight:(BOOL)isRight{
    if (!isLeft&&!isRight) {
        return;
    }
    [self layoutIfNeeded];
    UIBezierPath * apath = [UIBezierPath bezierPath];
    if (isLeft) {
        [apath moveToPoint:CGPointMake(0,0)];
        [apath addLineToPoint:CGPointMake(0,CGRectGetHeight(self.frame))];
    }
    if (isRight) {
        [apath moveToPoint:CGPointMake(CGRectGetWidth(self.frame),0)];
        [apath addLineToPoint:CGPointMake(CGRectGetWidth(self.frame),CGRectGetHeight(self.frame))];
    }
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    if (kObjectIsEmpty(color)) {
        shapeLayer.strokeColor = defaultColor.CGColor;
    }
    else{
        shapeLayer.strokeColor = color.CGColor;
        
    }
    
    if (width > 0.0) {
        shapeLayer.lineWidth = width;
    }
    else{
        shapeLayer.lineWidth = defaultWidth;
    }
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.path = apath.CGPath;
    [self.layer addSublayer:shapeLayer];
}


-(void)addLineWidth:(CGFloat)width withColor:(UIColor*)color inLeft:(BOOL)isLeft inRight:(BOOL)isRight leftEdgeInsets:(UIEdgeInsets)leftEdgeInsets rightEdgeInsets:(UIEdgeInsets)rightEdgeInsets{
    if (!isLeft&&!isRight) {
        return;
    }
    [self layoutIfNeeded];
    UIBezierPath * apath = [UIBezierPath bezierPath];
    if (isLeft) {
        [apath moveToPoint:CGPointMake(leftEdgeInsets.left,leftEdgeInsets.top)];
        [apath addLineToPoint:CGPointMake(leftEdgeInsets.left,CGRectGetHeight(self.frame)-leftEdgeInsets.bottom)];
    }
    if (isRight) {
        [apath moveToPoint:CGPointMake(CGRectGetWidth(self.frame)-rightEdgeInsets.right,rightEdgeInsets.top)];
        [apath addLineToPoint:CGPointMake(CGRectGetWidth(self.frame)-rightEdgeInsets.right,CGRectGetHeight(self.frame)-rightEdgeInsets.bottom)];
    }
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    if (kObjectIsEmpty(color)) {
        shapeLayer.strokeColor = defaultColor.CGColor;
    }
    else{
        shapeLayer.strokeColor = color.CGColor;
        
    }
    
    if (width > 0.0) {
        shapeLayer.lineWidth = width;
    }
    else{
        shapeLayer.lineWidth = defaultWidth;
    }
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.path = apath.CGPath;
    [self.layer addSublayer:shapeLayer];
}

-(void)addLineInLeftAndRight{
    [self addLineWidth:defaultWidth withColor:defaultColor inLeft:YES inRight:YES];
}
-(void)addLineInLeftAndRightWidth:(CGFloat)width{
    [self addLineWidth:width withColor:defaultColor inLeft:YES inRight:YES];
}
-(void)addLineInLeftAndRightWidth:(CGFloat)width withColor:(UIColor*)color{
    [self addLineWidth:width withColor:color inLeft:YES inRight:YES];
}

-(void)addLineInLeft{
    [self addLineWidth:defaultWidth withColor:defaultColor inLeft:YES inRight:NO];
}
-(void)addLineInLeftWidth:(CGFloat)width{
    [self addLineWidth:width withColor:defaultColor inLeft:YES inRight:NO];
}
-(void)addLineInLeftWidth:(CGFloat)width withColor:(UIColor*)color{
    [self addLineWidth:width withColor:color inLeft:YES inRight:NO];
}

-(void)addLineInRight{
    [self addLineWidth:defaultWidth withColor:defaultColor inLeft:NO inRight:YES];
}
-(void)addLineInRightWidth:(CGFloat)width{
    [self addLineWidth:width withColor:defaultColor inLeft:NO inRight:YES];
}
-(void)addLineInRightWidth:(CGFloat)width withColor:(UIColor*)color{
    [self addLineWidth:width withColor:color inLeft:NO inRight:YES];
}

-(void)addLineInLeftWidth:(CGFloat)width withColor:(UIColor*)color leftEdgeInsets:(UIEdgeInsets)leftEdgeInsets{
    [self addLineWidth:width withColor:color inLeft:YES inRight:NO leftEdgeInsets:leftEdgeInsets rightEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}

-(void)addLineInRightWidth:(CGFloat)width withColor:(UIColor*)color rightEdgeInsets:(UIEdgeInsets)rightEdgeInsets{
    [self addLineWidth:width withColor:color inLeft:NO inRight:YES leftEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0) rightEdgeInsets:rightEdgeInsets];
}
-(void)addTopWidth:(CGFloat)width withColor:(UIColor*)color topEdgeInsets:(UIEdgeInsets)topEdgeInsets;{
    [self addLineWidth:width withColor:color inTop:YES inBottom:NO topEdgeInsets:topEdgeInsets bottomEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}

-(void)addBottomWidth:(CGFloat)width withColor:(UIColor*)color bottomEdgeInsets:(UIEdgeInsets)bottomEdgeInsets{
    [self addLineWidth:width withColor:color inTop:NO inBottom:YES topEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0) bottomEdgeInsets:bottomEdgeInsets];
}


@end
