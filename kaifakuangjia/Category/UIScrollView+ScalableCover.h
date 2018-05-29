//
//
//
//  url:http://www.xiongcaichang.com
//  Created by bear on 16/3/31.
//  Copyright © 2016年 bear. All rights reserved.
//
#import <UIKit/UIKit.h>


static const CGFloat MaxHeight = 204;



@interface ScalableCover : UIImageView

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) CGFloat maxHeight;

@end




@interface UIScrollView (ScalableCover)

@property (nonatomic, weak) ScalableCover *scalableCover;

- (void)addScalableCoverWithImageView:(ScalableCover *)imageView;

- (void)removeScalableCover;

@end

