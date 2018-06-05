//
//  DNImageTitleModel.h
//  WheatField
//
//  Created by dotnar on 2017/4/29.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNImageTitleModel : NSObject
@property (nonatomic,copy) NSString* imageName;
@property (nonatomic,copy) NSString* titleName;
@property (nonatomic,copy) NSString* nextVCName;
@property (nonatomic,copy) NSString* detailStr;
@property (nonatomic,assign) BOOL haveMsg;
@property (nonatomic,assign) NSInteger msgCount;
@property (nonatomic,assign) BOOL isBinding;
@property (nonatomic,assign) BOOL isModify;

@property (nonatomic,assign) BOOL isNet;

@property (nonatomic,assign) BOOL isShowBingding;

@property (nonatomic,assign) BOOL isGestureLock;
@property (nonatomic,assign) BOOL isHaveLock;
@end
