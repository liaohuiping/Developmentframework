//
//  DNBoxView.h
//  WheatField
//
//  Created by dotnar on 2017/6/8.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DNBoxView : UIView
@property (nonatomic,strong) UIView* contentView;
@property (nonatomic,strong) UIView* customView;

@property(strong,nonatomic)void(^cancleButtonClick)();
@property(strong,nonatomic)void(^sureButtonClick)();

-(void)setupCancleButtonTitle:(NSString*)cancleString andSureButtonTitle:(NSString*)sureString;
@end
