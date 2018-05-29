//
//  DNReloadDataView.m
//  WheatField
//
//  Created by dotnar on 2017/5/26.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNReloadDataView.h"



@interface DNReloadDataView ()
@property (nonatomic,strong) UIImageView* reloadImageView;
@property (nonatomic,strong) UILabel* remindLabel;
@property (nonatomic,strong) UIButton* relodaButton;
@end

@implementation DNReloadDataView
-(UIImageView *)reloadImageView{
    if (!_reloadImageView) {
        _reloadImageView = [[UIImageView alloc]init];
        _reloadImageView.image = [UIImage imageNamed:kImage_NoNet];
    }
    return _reloadImageView;
}

-(UILabel *)remindLabel{
    if (!_remindLabel) {
        _remindLabel = [[UILabel alloc]init];
        _remindLabel.textAlignment = NSTextAlignmentCenter;
        _remindLabel.textColor = kDNColorFromRGB(0xB3B3B3);
        _remindLabel.font = [UIFont systemFontOfSize:20];
        _remindLabel.text = Localized(kText_NoNetReloadData);
    }
    return _remindLabel;
}

-(UIButton *)relodaButton{
    if (!_relodaButton) {
        _relodaButton = [[UIButton alloc]init];
        [_relodaButton setTitle:Localized(kText_ReloadData) forState:UIControlStateNormal];
        [_relodaButton setTitle:Localized(kText_ReloadData) forState:UIControlStateHighlighted];
        [_relodaButton setTitleColor:kDNColorFromRGB(0xCCCCCC) forState:UIControlStateNormal];
        [_relodaButton setTitleColor:kDNColorFromRGB(0xCCCCCC) forState:UIControlStateHighlighted];
        [_relodaButton addTarget:self action:@selector(clickReloadButton:) forControlEvents:UIControlEventTouchUpInside];
        _relodaButton.titleLabel.font = [UIFont systemFontOfSize:18];
    }
    return _relodaButton;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kColor_BackgroundColor;
        [self setupView];
        [self setupLayout];
    }
    return self;
}


#pragma mark -- setupView
-(void)setupView{
    [self addSubview:self.reloadImageView];
    [self addSubview:self.remindLabel];
    [self addSubview:self.relodaButton];
}

-(void)setupLayout{
    [self layoutIfNeeded];

    CGFloat selfH = kSceenHeight - kNavigationHeight - TarbarHeight;
    
    [self.reloadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(kSceenWidth);
        make.height.mas_equalTo((selfH / 2) - 45 );
    }];
    
    [self.remindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.reloadImageView.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(kSceenWidth);
        make.height.mas_equalTo(45);
    }];
    
    [self.relodaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.remindLabel.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(kButtonHeight);
        make.width.mas_equalTo(kSceenWidth);
    }];
    
}

#pragma mark -- button event
-(void)clickReloadButton:(UIButton*)button{
    if (self.reloadButtonClick) {
        self.reloadButtonClick();
    }
}
@end
