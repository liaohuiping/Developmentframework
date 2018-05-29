//
//  UIImage+CO.h
//  WheatField
//
//  Created by dotnar on 2017/5/12.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CO)
/**
 *  返回一个裁剪的图片复制到给定的范围，使用CGRectIntegral边界将被调整，这种方法忽略了图像的imageOrientation设置。
 *
 *  @param bounds bounds description
 *
 *  @return return value description
 */
- (UIImage *)croppedImage:(CGRect)bounds;

/**
 * Returns a rescaled copy of the image, taking into account its orientation
 * The image will be scaled disproportionately if necessary to fit the bounds specified by the parameter
 *
 *  @param thumbnailSize thumbnailSize description
 *  @param quality       quality description
 *
 *  @return return value description
 */
- (UIImage *)thumbnailImage:(NSInteger)thumbnailSize
       interpolationQuality:(CGInterpolationQuality)quality;

/**
 *  返回一个新副本的形象,考虑其取向，图像将改不成比例的如果有必要以适应指定的边界参数
 *
 *  @param newSize newSize description
 *  @param quality quality description
 *
 *  @return return value description
 */
- (UIImage *)resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;

/**
 *  调整图像的大小根据给定的内容模式,考虑到图像的方向
 *
 *  @param contentMode contentMode description
 *  @param bounds      bounds description
 *  @param quality     quality description
 *
 *  @return return value description
 */
- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;

/**
 通过指定颜色画成图片

 @param color 颜色
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
/*!
 *  @author Neslon, 16-07-29 13:07:49
 *
 *  @brief 通过frame画指定颜色的背景图片
 *
 *  @param color <#color description#>
 *  @param frame <#frame description#>
 *
 *  @return <#return value description#>
 */
+(UIImage *)imageWithWithColor:(UIColor *)color frame:(CGRect)frame;
/*!
 @author YangJiu, 16-08-06 12:08
 
 @brief 从资源路径获取图片
 
 @param name 图片名称
 
 @return 图片
 */
+(UIImage*)imageFromPathFileName:(NSString*)name;
@end
