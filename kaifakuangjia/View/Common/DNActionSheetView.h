//
//  DNActionSheetView.h
//  WheatField
//
//  Created by dotnar on 2017/6/14.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DNActionSheetView : UIView

-(instancetype)initWithFrame:(CGRect)frame withActionArr:(NSArray*)actionArr;
@property(strong,nonatomic)void(^cellDidSelected)(NSIndexPath* indexPath);
@property(strong,nonatomic)void(^otherViewTouched)(void);
@end
