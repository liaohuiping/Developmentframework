//
//  DNBoxView.m
//  WheatField
//
//  Created by dotnar on 2017/6/8.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNBoxView.h"
@interface DNBoxView ()



@property (nonatomic,strong) UIButton* cancleButton;
@property (nonatomic,strong) UIButton* sureButton;
@end

@implementation DNBoxView


-(UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.cornerRadius = 6;
        _contentView.layer.masksToBounds = YES;
    }
    return _contentView;
}

-(UIView*)customView{
    if (!_customView) {
        _customView = [[UIView alloc]init];
        _customView.backgroundColor = [UIColor clearColor];
    }
    return _customView;
}


-(UIButton *)cancleButton{
    if (!_cancleButton) {
        _cancleButton = [[UIButton alloc]init];
        _cancleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_cancleButton setTitleColor:kColor_TitleNormalColor forState:UIControlStateNormal];
        [_cancleButton setTitleColor:kColor_TitleNormalColor forState:UIControlStateDisabled];
        [_cancleButton setTitleColor:kColor_TitleNormalColor forState:UIControlStateHighlighted];
        [_cancleButton setTitle:Localized(kText_Cancle) forState:UIControlStateNormal];
        [_cancleButton setTitle:Localized(kText_Cancle) forState:UIControlStateDisabled];
        [_cancleButton setTitle:Localized(kText_Cancle) forState:UIControlStateHighlighted];
        [_cancleButton  addTarget:self action:@selector(clickCancleButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleButton;
}

-(UIButton *)sureButton{
    if (!_sureButton) {
        _sureButton = [[UIButton alloc]init];
        _sureButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [_sureButton setTitle:Localized(kText_Sure) forState:UIControlStateNormal];
        [_sureButton setTitle:Localized(kText_Sure) forState:UIControlStateDisabled];
        [_sureButton setTitle:Localized(kText_Sure) forState:UIControlStateHighlighted];
        [_sureButton  addTarget:self action:@selector(clickSureButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureButton;
}


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor  =kColor_AlphaViewColor;
        [self setupView];
        [self setupLayout];
    }
    return self;
}


#pragma mark -- setupView
-(void)setupView{
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.customView];
    [self.contentView addSubview:self.cancleButton];
    [self.contentView addSubview:self.sureButton];
    
}

-(void)setupLayout{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.left.mas_equalTo(kBoxLeftSpace);
        make.height.mas_equalTo(200).priorityLow();
    }];
    
    [self.cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(kButtonHeight);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.width.mas_equalTo(kSceenWidth/2-kBoxLeftSpace);
    }];
    
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(kButtonHeight);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.width.mas_equalTo(kSceenWidth/2-kBoxLeftSpace);
    }];
    
    [self.customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.cancleButton.mas_top);
    }];
    
    [self.cancleButton layoutIfNeeded];
    [self.cancleButton setBackgroundImage:[UIImage imageWithWithColor:kColor_BackgroundColor frame:self.cancleButton.frame] forState:UIControlStateNormal];
    [self.cancleButton setBackgroundImage:[UIImage imageWithWithColor:kColor_BackgroundColor frame:self.cancleButton.frame] forState:UIControlStateHighlighted];
    [self.cancleButton setBackgroundImage:[UIImage imageWithWithColor:kColor_BackgroundColor frame:self.cancleButton.frame] forState:UIControlStateDisabled];
    
    [self.sureButton layoutIfNeeded];
    [self.sureButton setBackgroundImage:[UIImage imageWithWithColor:kColor_ButtonNomalColor frame:self.sureButton.frame] forState:UIControlStateNormal];
    [self.sureButton setBackgroundImage:[UIImage imageWithWithColor:kColor_ButtonHighlightColor frame:self.sureButton.frame] forState:UIControlStateHighlighted];
    [self.sureButton setBackgroundImage:[UIImage imageWithWithColor:kColor_ButtonDisableColor frame:self.sureButton.frame] forState:UIControlStateDisabled];
}

#pragma makr -- button event
-(void)clickCancleButton:(UIButton*)button{
    [self endEditing:YES];
    if (self.cancleButtonClick) {
        self.cancleButtonClick();
    }
}

-(void)clickSureButton:(UIButton*)button{
    [self endEditing:YES];
    if (self.sureButtonClick) {
        self.sureButtonClick();
    }
}

#pragma mark -- set up
-(void)setupCancleButtonTitle:(NSString *)cancleString andSureButtonTitle:(NSString *)sureString{
    [_cancleButton setTitle:Localized(cancleString) forState:UIControlStateNormal];
    [_cancleButton setTitle:Localized(cancleString) forState:UIControlStateDisabled];
    [_cancleButton setTitle:Localized(cancleString) forState:UIControlStateHighlighted];
    [_sureButton setTitle:Localized(sureString) forState:UIControlStateNormal];
    [_sureButton setTitle:Localized(sureString) forState:UIControlStateDisabled];
    [_sureButton setTitle:Localized(sureString) forState:UIControlStateHighlighted];
    if (kStringIsEmpty(cancleString)&& kStringIsEmpty(sureString)) {
        [self.cancleButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
        }];
        
        [self.sureButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
        }];
    }
    else if(kStringIsEmpty(cancleString)&&!kStringIsEmpty(sureString)){
        [self.cancleButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
        }];
        
        [self.sureButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kSceenWidth-2*kBoxLeftSpace);
        }];
    }
    else if(!kStringIsEmpty(cancleString)&&kStringIsEmpty(sureString)){
        [self.cancleButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kSceenWidth-2*kBoxLeftSpace);
        }];
        
        [self.sureButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
        }];
    }
    else if(!kStringIsEmpty(cancleString)&&!kStringIsEmpty(sureString)){
        [self.cancleButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kSceenWidth/2-kBoxLeftSpace);
        }];
        
        [self.sureButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kSceenWidth/2-kBoxLeftSpace);
        }];
    }
    else{
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
@end
