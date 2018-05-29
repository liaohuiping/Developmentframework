//
//  DNLayerAnimation.h
//  WheatField
//
//  Created by dotnar on 2017/5/2.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ScaleTransformType) {
    ScaleTransformTypeDefault = 0,//Default ScaleTransformTypeXY
    ScaleTransformTypeX,
    ScaleTransformTypeY,
    ScaleTransformTypeXY,
};

typedef NS_ENUM(NSInteger,RotationTransformType) {
    RotationTransformTypeDefault = 0,//Default RotationTransformTypeZ
    RotationTransformTypeX,
    RotationTransformTypeY,
    RotationTransformTypeZ,
};

@interface DNLayerAnimation : NSObject
/**
 *  振动动画
 *
 *  @param duration    一次动画时长
 *  @param originPoint 一次动画开始的位置（视图中心位置）
 *  @param endPoint    一次动画结束位置（视图中心位置） 振动方向可通过起始位置、和结束位置 设定
 *
 *  @return
 */
+(CABasicAnimation *)shakeAnimationDuration:(CFTimeInterval)duration originPoint:(CGPoint)originPoint endPoint:(CGPoint)endPoint;
/**
 *  放缩动画
 *
 *  @param scaleTransformType 放缩类型（默认，xy都同时放缩）
 *  @param duration            一次动画时长
 *  @param originScale        一次动画开始时放缩比
 *  @param endScale           一次动画结束时放缩比
 *
 *  @return
 */
+(CABasicAnimation *)scaleAnimationScaleType:(ScaleTransformType)scaleTransformType duration:(CFTimeInterval)duration originScale:(CGFloat)originScale endScale:(CGFloat)endScale;
/**
 *  旋转动画
 *
 *  @param rotationTransformType 旋转类型（绕x、y、z轴旋转，默认z）
 *  @param duration              一次动画时长
 *  @param originAngle           一次动画起始角度
 *  @param endAngle              一次动画结束角度   顺逆 方向可通过开始和结束角度设定
 *
 *  @return
 */
+(CABasicAnimation *)rotationAnimationRotationType:(RotationTransformType)rotationTransformType duration:(CFTimeInterval)duration originAngle:(CGFloat)originAngle endAngle:(CGFloat)endAngle;

+(CABasicAnimation*)opacityAnimationDuration:(CFTimeInterval)duration originOpacity:(CGFloat)originOpacity endOpacity:(CGFloat)endOpacity;

@end
