//
//  UIImageView+GifFromPng.m
//  WheatField
//
//  Created by dotnar on 2017/9/20.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "UIImageView+GifFromPng.h"



@implementation UIImageView (GifFromPng)
-(void)setTimer:(NSTimer *)timer{
    self.timer = timer;
}
-(NSTimer *)timer{
    return self.timer;
}
-(void)setCurrentCount:(NSInteger)currentCount{
    self.currentCount = currentCount;
}
-(NSInteger)currentCount{
    return self.currentCount;
}

-(void)setBaseName:(NSString *)baseName{
    self.baseName = baseName;
}

-(NSString *)baseName{
    return self.baseName;
}
-(void)setAllCount:(NSInteger)allCount{
    self.allCount = allCount;
}

-(NSInteger)allCount{
    return self.allCount;
}

-(void)setAnimationComplete:(void (^)())animationComplete{
    self.animationComplete = animationComplete;
}

-(void (^)())animationComplete{
    return self.animationComplete;
}
-(void)startAnimatingWithCommonName:(NSString *)commonName intervalPer:(CGFloat)interval pictureCount:(NSInteger)count{
    if (kStringIsEmpty(commonName)||count <= 0 || interval <= 0) {
        LogErrorLevel(@"参数不能为空");
        return;
    }
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.currentCount = 0;
    self.baseName = commonName;
    self.allCount = count;
    
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:weakSelf selector:@selector(changeImage:) userInfo:nil repeats:YES];
}

-(void)changeImage:(NSTimer*)timer{
    if (self.currentCount >= self.allCount && self.animationComplete) {
        self.animationComplete();
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
            self.currentCount = 0;
            self.baseName = @"";
            self.allCount = 0;
        }
    }
    NSString* imageName = [NSString stringWithFormat:@"%@%05ld",self.baseName,(long)self.currentCount];
    NSString* fileURL = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
    if (kStringIsEmpty(fileURL)) {
        LogErrorLevel(@"图片未找到");
    }
    self.image = [UIImage imageWithContentsOfFile:fileURL];
    self.currentCount++;
}
@end
