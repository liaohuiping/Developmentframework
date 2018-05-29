//
//  UIImageView+GifFromPng.h
//  WheatField
//
//  Created by dotnar on 2017/9/20.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (GifFromPng)
@property (nonatomic,strong) NSTimer* timer;
@property (nonatomic,assign) NSInteger currentCount;
@property (nonatomic,strong) NSString* baseName;
@property (nonatomic,assign) NSInteger allCount;
@property(strong,nonatomic)void(^animationComplete)();

-(void)startAnimatingWithCommonName:(NSString*)commonName intervalPer:(CGFloat)interval pictureCount:(NSInteger)count;
@end
