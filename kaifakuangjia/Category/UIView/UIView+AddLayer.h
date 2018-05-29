//
//  UIView+AddLayer.h
//  WheatField
//
//  Created by dotnar on 2017/5/3.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  @author Justin, 17-05-03 15:05:45
 *
 *  uiview layer层处理
 */
@interface UIView (AddLayer)
/**
 *  @author Justin, 17-05-03 15:05:46
 *
 *  在视图上下添加线条 （默认宽度、默认颜色）
 */
-(void)addLineInTopAndBottom;
/**
 *  @author Justin, 17-05-03 15:05:29
 *
 *  在视图上下添加线条 （默认颜色）
 *
 *  @param width 设置宽度
 */
-(void)addLineInTopAndBottomWidth:(CGFloat)width;
/**
 *  @author Justin, 17-05-03 15:05:58
 *
 *  在视图上下添加线条 ）
 *
 *  @param width 设置宽度
 *  @param color 设置颜色
 */
-(void)addLineInTopAndBottomWidth:(CGFloat)width withColor:(UIColor*)color;

/**
 *  @author Justin, 17-05-03 15:05:24
 *
 *  在视图上添加线条 （默认宽度、默认颜色）
 */
-(void)addLineInTop;
/**
 *  @author Justin, 17-05-03 15:05:40
 *
 *  在视图上添加线条 （默认颜色）
 *
 *  @param width 设置宽度
 */
-(void)addLineInTopWidth:(CGFloat)width;
/**
 *  @author Justin, 17-05-03 15:05:02
 *
 *  在视图上添加线条
 *
 *  @param width 设置宽度
 *  @param color 设置颜色
 */
-(void)addLineInTopWidth:(CGFloat)width withColor:(UIColor*)color;

/**
 *  @author Justin, 17-05-03 15:05:55
 *
 *  在视图下方添加线条 （默认宽度、默认颜色）
 */
-(void)addLineInBottom;
/**
 *  @author Justin, 17-05-03 15:05:52
 *
 *  在视图下方添加线条 （默认颜色）
 *
 *  @param width 设置宽度
 */
-(void)addLineInBottomWidth:(CGFloat)width;
/**
 *  @author Justin, 17-05-03 15:05:46
 *
 *  在视图下方添加线条
 *
 *  @param width 设置宽度
 *  @param color 设置颜色
 */
-(void)addLineInBottomWidth:(CGFloat)width withColor:(UIColor*)color;



/**
 *  @author Justin, 17-05-03 15:05:46
 *
 *  在视图左右添加线条 （默认宽度、默认颜色）
 */
-(void)addLineInLeftAndRight;
/**
 *  @author Justin, 17-05-03 15:05:29
 *
 *  在视图左右添加线条 （默认颜色）
 *
 *  @param width 设置宽度
 */
-(void)addLineInLeftAndRightWidth:(CGFloat)width;
/**
 *  @author Justin, 17-05-03 15:05:58
 *
 *  在视图左右添加线条 ）
 *
 *  @param width 设置宽度
 *  @param color 设置颜色
 */
-(void)addLineInLeftAndRightWidth:(CGFloat)width withColor:(UIColor*)color;

/**
 *  @author Justin, 17-05-03 15:05:24
 *
 *  在视图左添加线条 （默认宽度、默认颜色）
 */
-(void)addLineInLeft;
/**
 *  @author Justin, 17-05-03 15:05:40
 *
 *  在视图左添加线条 （默认颜色）
 *
 *  @param width 设置宽度
 */
-(void)addLineInLeftWidth:(CGFloat)width;
/**
 *  @author Justin, 17-05-03 15:05:02
 *
 *  在视图左添加线条
 *
 *  @param width 设置宽度
 *  @param color 设置颜色
 */
-(void)addLineInLeftWidth:(CGFloat)width withColor:(UIColor*)color;

/**
 *  @author Justin, 17-05-03 15:05:55
 *
 *  在视图右方添加线条 （默认宽度、默认颜色）
 */
-(void)addLineInRight;
/**
 *  @author Justin, 17-05-03 15:05:52
 *
 *  在视图右方添加线条 （默认颜色）
 *
 *  @param width 设置宽度
 */
-(void)addLineInRightWidth:(CGFloat)width;
/**
 *  @author Justin, 17-05-03 15:05:46
 *
 *  在视图右方添加线条
 *
 *  @param width 设置宽度
 *  @param color 设置颜色
 */
-(void)addLineInRightWidth:(CGFloat)width withColor:(UIColor*)color;

-(void)addLineInLeftWidth:(CGFloat)width withColor:(UIColor*)color leftEdgeInsets:(UIEdgeInsets)leftEdgeInsets;

-(void)addLineInRightWidth:(CGFloat)width withColor:(UIColor*)color rightEdgeInsets:(UIEdgeInsets)rightEdgeInsets;

-(void)addTopWidth:(CGFloat)width withColor:(UIColor*)color topEdgeInsets:(UIEdgeInsets)topEdgeInsets;

-(void)addBottomWidth:(CGFloat)width withColor:(UIColor*)color bottomEdgeInsets:(UIEdgeInsets)bottomEdgeInsets;
@end
