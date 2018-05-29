//
//  YLImageView.h
//  YLGIFImage
//
//  Created by Yong Li on 14-3-2.
//  Copyright (c) 2014年 Yong Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLImageView : UIImageView
@property(strong,nonatomic)void(^stopAnimationView)(void);
@property (nonatomic, copy) NSString *runLoopMode;
@property (nonatomic) NSUInteger loopCountdown;


@property(strong,nonatomic)void(^animationComplete)(void);
-(void)startAnimatingWithCommonName:(NSString*)commonName intervalPer:(CGFloat)interval pictureCount:(NSInteger)count;
@end
