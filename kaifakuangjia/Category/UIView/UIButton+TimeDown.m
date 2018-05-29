//
//  UIButton+TimeDown.m
//  WheatField
//
//  Created by dotnar on 2017/9/1.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "UIButton+TimeDown.h"
static NSInteger kTimeOut = 59; //倒计时时间

@implementation UIButton (TimeDown)
-(void)startTime{
    kTimeOut=59;
    __weak typeof(self)weakSelf=self;
    __block NSDate* blockStartDate = [NSDate date];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        
        if(kTimeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf setTitle:Localized(kText_GetSecurityCode) forState:UIControlStateNormal];
                [weakSelf setTitle:Localized(kText_GetSecurityCode) forState:UIControlStateHighlighted];
                weakSelf.enabled = YES;
            });
        }
        else{
            NSInteger seconds = kTimeOut % 60 ;
            NSString *strTime = [NSString stringWithFormat:@"%.2ld", (long)seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //LogDebugLevelWithFunc(@"____%@",strTime);
                [weakSelf setTitle:[NSString stringWithFormat:@"%@s",strTime] forState:UIControlStateNormal];
                [weakSelf setTitle:[NSString stringWithFormat:@"%@s",strTime] forState:UIControlStateHighlighted];
                weakSelf.enabled = NO;
            });
            
            NSTimeInterval timeInterval = (int)[[NSDate date]timeIntervalSinceDate:blockStartDate];
            kTimeOut = 59 - timeInterval;
        }
    });
    dispatch_resume(_timer);
}
-(void)resetTime{
    kTimeOut = 0;
}
@end
