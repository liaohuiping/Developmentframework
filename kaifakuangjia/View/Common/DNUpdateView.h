//
//  DNUpdateView.h
//  WheatField
//
//  Created by dotnar on 2017/7/1.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DNUpdateModel;
@interface DNUpdateView : UIView
@property(strong,nonatomic)void(^updateButtonClick)();
@property(strong,nonatomic)void(^cancleButtonClick)();

@property (strong,nonatomic) DNUpdateModel* updateModel;

@end
