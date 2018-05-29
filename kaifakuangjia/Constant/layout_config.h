//
//  layout_config.h
//  WheatField
//
//  Created by dotnar on 2017/5/3.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#ifndef layout_config_h
#define layout_config_h

#define kSeparateHeight (1 / [UIScreen mainScreen].scale) //像素线
#define kNavigationHeight (kIPhoneXinch? 88:64) //适配iphonex动态导航栏高度
#define kScaleWithHeight(height) (height*kSceenHeight/640.0)
#define kScaleWithWidth(width) (width*kSceenWidth/375.0)
#define kStatuBarHeight (kIPhoneXinch? 44:20)
#define kMarginX WG(10)
#define kMarginY WG(15)

static CGFloat const kMarginHeight = 20;
static CGFloat const kCorner = 5;
static CGFloat const kVerInterval = 6;
static CGFloat const kLeftInterval = 13;
static CGFloat const kHeightInterval = 10;
static CGFloat const kRightInterval = 13;
static CGFloat const kVerHeight = 23;
static CGFloat const kCellDefaultHeight = 50;
static CGFloat const kCellMiddleHeight = 70;
static CGFloat const kTextFieldHeight = 44;
static CGFloat const kIphonexNavAdd = 24;
static CGFloat const kIphonexBottomAdd = 34;
static CGFloat const kNavTitleHeight = 44;
static CGFloat const kLeftSpace = 30;
static CGFloat const kRightSpace = 30;
static CGFloat const kSegementHeight = 40;

static CGFloat const kLeftBigInterval = 27;
static CGFloat const kRightBigInterval = 27;


static CGFloat const kVerSpace = 21;

static CGFloat const kButtonBottomHeight = 15;



static CGFloat const kButtonLowHeight = 40;
static CGFloat const kButtonHeight = 44;
static CGFloat const kButtonMoreHeight = 50;

static CGFloat const kCornerRadius = 4;

static CGFloat const kBoxLeftSpace = 35;
static CGFloat const kBoxRightSpace =  35;



#endif /* layout_config_h */
