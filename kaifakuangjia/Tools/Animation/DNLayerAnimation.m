//
//  DNLayerAnimation.m
//  WheatField
//
//  Created by dotnar on 2017/5/2.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNLayerAnimation.h"

@implementation DNLayerAnimation
+(CABasicAnimation *)shakeAnimationDuration:(CFTimeInterval)duration originPoint:(CGPoint)originPoint endPoint:(CGPoint)endPoint{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = duration;
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    animation.fromValue = [NSValue valueWithCGPoint:originPoint];
    animation.toValue = [NSValue valueWithCGPoint:endPoint];
    animation.fillMode = kCAFillModeRemoved;
    animation.removedOnCompletion = NO;
    return animation;
}

+(CABasicAnimation *)scaleAnimationScaleType:(ScaleTransformType)scaleTransformType duration:(CFTimeInterval)duration originScale:(CGFloat)originScale endScale:(CGFloat)endScale{
    CABasicAnimation *animation;
    switch (scaleTransformType) {
        case ScaleTransformTypeX:
        {
            animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
        }
            break;
        case ScaleTransformTypeY:
        {
            animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
        }
            break;
        case ScaleTransformTypeXY:
        {
            animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        }
            break;
        default:
        {
            animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        }
            break;
    }
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = duration;
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    animation.fromValue = [NSNumber numberWithFloat:originScale];
    animation.toValue = [NSNumber numberWithFloat:endScale];
    animation.fillMode = kCAFillModeRemoved;
    animation.removedOnCompletion = NO;
    return animation;
}

+(CABasicAnimation *)rotationAnimationRotationType:(RotationTransformType)rotationTransformType duration:(CFTimeInterval)duration originAngle:(CGFloat)originAngle endAngle:(CGFloat)endAngle{
    CABasicAnimation *animation;
    switch (rotationTransformType) {
        case RotationTransformTypeX:
        {
            animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
            
        }
            break;
        case RotationTransformTypeY:
        {
            animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
        }
            break;
        case RotationTransformTypeZ:
        {
            animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        }
            break;
        default:
        {
            animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        }
            break;
    }
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = duration;
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = NO;
    animation.fillMode = kCAFillModeRemoved;
    animation.fromValue = [NSNumber numberWithFloat:originAngle];
    animation.toValue = [NSNumber numberWithFloat:endAngle];
    animation.removedOnCompletion = NO;
    return animation;
}

+(CABasicAnimation *)opacityAnimationDuration:(CFTimeInterval)duration originOpacity:(CGFloat)originOpacity endOpacity:(CGFloat)endOpacity{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = duration;
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    animation.fromValue = [NSNumber numberWithFloat:originOpacity];
    animation.toValue = [NSNumber numberWithFloat:endOpacity];
    animation.fillMode = kCAFillModeRemoved;
    animation.removedOnCompletion = NO;
    return animation;
}

@end
