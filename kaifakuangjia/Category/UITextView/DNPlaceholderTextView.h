//
//  DNPlaceholderTextView.h
//  WheatField
//
//  Created by dotnar on 2017/5/15.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DNPlaceholderTextView : UITextView
/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;
@end
