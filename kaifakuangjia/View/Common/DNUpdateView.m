//
//  DNUpdateView.m
//  WheatField
//
//  Created by dotnar on 2017/7/1.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNUpdateView.h"
#import "DNUpdateModel.h"

#define kWidth (kSceenWidth - 2*kLeftBigInterval -130)
#define kRate 927.0/572.0
@interface DNUpdateView ()
@property (nonatomic,strong) UIView* contentView;
@property (nonatomic,strong) UIImageView* backImageView;
@property (nonatomic,strong) UIImageView* roundImageview;
@property (nonatomic,strong) UILabel* latestTagLabel;
@property (nonatomic,strong) UILabel* latestLabel;
@property (nonatomic,strong) UILabel* sizeTagLabel;
@property (nonatomic,strong) UILabel* sizeLabel;
@property (nonatomic,strong) UILabel* contentTagLabel;
@property (nonatomic,strong) UILabel* contentLabel;

@property (nonatomic,strong) UIButton* updateButton;
@property (nonatomic,strong) UIButton* cancleButton;
@end

@implementation DNUpdateView

-(UIView*)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.clipsToBounds = NO;
        _contentView.layer.cornerRadius = 10;
        _contentView.layer.masksToBounds = YES;
    }
    return _contentView;
}

-(UIImageView *)backImageView{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc]init];
     
        _backImageView.image = [UIImage imageNamed:@""];
       
    }
    return _backImageView;
}

-(UIImageView*)roundImageview{
    if (!_roundImageview) {
        _roundImageview = [[UIImageView alloc]init];
        _roundImageview.image = [UIImage imageNamed:@""];
    }
    return _roundImageview;
}

-(UILabel*)latestTagLabel{
    if (!_latestTagLabel) {
        _latestTagLabel = [[UILabel alloc]init];
        _latestTagLabel.font = [UIFont boldSystemFontOfSize:14];
        _latestTagLabel.text = Localized(kText_UpdateNewVersion);
        _latestTagLabel.textAlignment = NSTextAlignmentLeft;
        _latestTagLabel.textColor = kColor_TitleMainColor;
    }
    return _latestTagLabel;
}

-(UILabel*)latestLabel{
    if (!_latestLabel) {
        _latestLabel = [[UILabel alloc]init];
        _latestLabel.font = [UIFont boldSystemFontOfSize:14];
        _latestLabel.textAlignment = NSTextAlignmentLeft;
        _latestLabel.textColor = kColor_TitleMainColor;
    }
    return _latestLabel;
}


-(UILabel*)sizeTagLabel{
    if (!_sizeTagLabel) {
        _sizeTagLabel = [[UILabel alloc]init];
        _sizeTagLabel.font = [UIFont boldSystemFontOfSize:14];
        _sizeTagLabel.text = Localized(kText_UpdateNewVersionSize);
        _sizeTagLabel.textAlignment = NSTextAlignmentLeft;
        _sizeTagLabel.textColor = kColor_TitleMainColor;
    }
    return _sizeTagLabel;
}

-(UILabel*)sizeLabel{
    if (!_sizeLabel) {
        _sizeLabel = [[UILabel alloc]init];
        _sizeLabel.font = [UIFont systemFontOfSize:14];
        _sizeLabel.textAlignment = NSTextAlignmentLeft;
        _sizeLabel.textColor = kColor_TitleMainColor;
    }
    return _sizeLabel;
}

-(UILabel*)contentTagLabel{
    if (!_contentTagLabel) {
        _contentTagLabel = [[UILabel alloc]init];
        _contentTagLabel.font = [UIFont boldSystemFontOfSize:14];
        _contentTagLabel.text = Localized(kText_UpdateNewVersionContent);
        _contentTagLabel.textAlignment = NSTextAlignmentLeft;
        _contentTagLabel.textColor = kColor_TitleMainColor;
    }
    return _contentTagLabel;
}

-(UILabel*)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.textColor = kColor_TitleMainColor;
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

-(UIButton *)cancleButton{
    if (!_cancleButton) {
        _cancleButton = [[UIButton alloc]init];
        [_cancleButton setTitle:Localized(kText_UpdateIgnore) forState:UIControlStateNormal];
        [_cancleButton setTitle:Localized(kText_UpdateIgnore) forState:UIControlStateHighlighted];
        [_cancleButton setTitleColor:kDNColorFromRGB(0x656565) forState:UIControlStateNormal];
        [_cancleButton setTitleColor:kDNColorFromRGB(0x656565) forState:UIControlStateHighlighted];
        _cancleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_cancleButton addTarget:self action:@selector(clickCancleButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleButton;
}

-(UIButton *)updateButton {
    if (!_updateButton) {
        _updateButton = [[UIButton alloc]init];
        [_updateButton setTitle:Localized(kText_UpdateVersion) forState:UIControlStateNormal];
        [_updateButton setTitle:Localized(kText_UpdateVersion) forState:UIControlStateHighlighted];
        [_updateButton setTitleColor:kDNColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_updateButton setTitleColor:kDNColorFromRGB(0xFFFFFF) forState:UIControlStateHighlighted];
        _updateButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_updateButton addTarget:self action:@selector(clickUpdateButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _updateButton;
}


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kColor_AlphaViewColor;
        [self setupView];
        [self setupLayout];
    }
    return self;
}


#pragma mark -- setupView
-(void)setupView{
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.backImageView];
    [self addSubview:self.roundImageview];
    [self.contentView addSubview:self.latestTagLabel];
    [self.contentView addSubview:self.latestLabel];
    [self.contentView addSubview:self.sizeTagLabel];
    [self.contentView addSubview:self.sizeLabel];
    [self.contentView addSubview:self.contentTagLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.cancleButton];
    [self.contentView addSubview:self.updateButton];
    
}

-(void)setupLayout{
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.left.mas_equalTo(kLeftBigInterval);
        make.height.mas_equalTo(360).priorityLow();
    }];
    
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(170);
    }];
    
    [self.roundImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(-20);
        make.left.mas_equalTo((kSceenWidth-2*kLeftBigInterval)/2-kNavigationHeight+kLeftBigInterval);
        make.size.mas_equalTo(CGSizeMake(186, 170));
    }];
    
    [self.latestTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kWidth/2);
        make.top.mas_equalTo(self.backImageView.mas_bottom).mas_offset(20);
    }];
    [self.latestLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.latestTagLabel.mas_centerY);
        make.left.mas_equalTo(self.latestTagLabel.mas_right);
    }];
    [self.sizeTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kWidth/2);
        make.top.mas_equalTo(self.latestTagLabel.mas_bottom).mas_offset(10);
    }];
    [self.sizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.sizeTagLabel.mas_centerY);
        make.left.mas_equalTo(self.sizeTagLabel.mas_right);
    }];
    
    [self.contentTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kWidth/2);
        make.top.mas_equalTo(self.sizeTagLabel.mas_bottom).mas_offset(10);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentTagLabel.mas_bottom).mas_offset(7);
        make.left.mas_equalTo(kWidth/2);
        make.right.mas_equalTo(-kWidth/4);
    }];
    
    [self.updateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentLabel.mas_bottom).mas_offset(25);
        make.height.mas_equalTo(kButtonHeight);
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(self.cancleButton.mas_right);
        make.width.mas_equalTo(self.cancleButton.mas_width);
    }];
    
    [self.cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentLabel.mas_bottom).mas_offset(25);
        make.height.mas_equalTo(kButtonHeight);
        make.left.mas_equalTo(0);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.updateButton.mas_bottom);
    }];
    [self.backImageView layoutIfNeeded];
    [self.cancleButton layoutIfNeeded];
    [self.updateButton layoutIfNeeded];
    [self.cancleButton setBackgroundImage:[UIImage imageWithWithColor:[UIColor whiteColor] frame:self.cancleButton.frame] forState:UIControlStateNormal];
    [self.cancleButton setBackgroundImage:[UIImage imageWithWithColor:[UIColor whiteColor] frame:self.cancleButton.frame] forState:UIControlStateHighlighted];
    [self.updateButton setBackgroundImage:[UIImage imageWithWithColor:kColor_MainViewColor frame:self.updateButton.frame] forState:UIControlStateNormal];
    [self.updateButton setBackgroundImage:[UIImage imageWithWithColor:kColor_MainViewColor frame:self.updateButton.frame] forState:UIControlStateHighlighted];
    [self.updateButton setBackgroundImage:[UIImage imageWithWithColor:kColor_ButtonDisableColor frame:self.updateButton.frame] forState:UIControlStateDisabled];
}

#pragma mark -- button event
-(void)clickCancleButton:(UIButton*)button{
    if (self.cancleButtonClick) {
        self.cancleButtonClick();
    }
}
-(void)clickUpdateButton:(UIButton*)button{
    if (self.updateButtonClick) {
        self.updateButtonClick();
    }
}


-(void)setUpdateModel:(DNUpdateModel *)updateModel{
    _updateModel = updateModel;
    if (updateModel.isMust) {
        [self.updateButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentLabel.mas_bottom).mas_offset(25);
            make.height.mas_equalTo(kButtonHeight);
            make.right.mas_equalTo(0);
            make.left.mas_equalTo(self.cancleButton.mas_right);
        }];
        
        [self.cancleButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentLabel.mas_bottom).mas_offset(25);
            make.height.mas_equalTo(kButtonHeight);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(0);
        }];
        
    }
    else{
        [self.updateButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentLabel.mas_bottom).mas_offset(25);
            make.height.mas_equalTo(kButtonHeight);
            make.right.mas_equalTo(0);
            make.left.mas_equalTo(self.cancleButton.mas_right);
            make.width.mas_equalTo(self.cancleButton.mas_width);
        }];
        
        [self.cancleButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentLabel.mas_bottom).mas_offset(25);
            make.height.mas_equalTo(kButtonHeight);
            make.left.mas_equalTo(0);
        }];
        
    }
    [self.cancleButton layoutIfNeeded];
    [self.updateButton layoutIfNeeded];
    [self.cancleButton setBackgroundImage:[UIImage imageWithWithColor:kDNColorFromRGB(0xF2F2F2) frame:self.cancleButton.frame] forState:UIControlStateNormal];
    [self.cancleButton setBackgroundImage:[UIImage imageWithWithColor:kDNColorFromRGB(0xF2F2F2) frame:self.cancleButton.frame] forState:UIControlStateHighlighted];
    [self.updateButton setBackgroundImage:[UIImage imageWithWithColor:kColor_ButtonNomalColor frame:self.updateButton.frame] forState:UIControlStateNormal];
    [self.updateButton setBackgroundImage:[UIImage imageWithWithColor:kColor_ButtonHighlightColor frame:self.updateButton.frame] forState:UIControlStateHighlighted];
    [self.updateButton setBackgroundImage:[UIImage imageWithWithColor:kColor_ButtonDisableColor frame:self.updateButton.frame] forState:UIControlStateDisabled];

    self.latestLabel.text = updateModel.showVersion;
    self.sizeLabel.text = updateModel.showAppSize;

    @try {
        if (kStringIsEmpty(updateModel.updateContent)) {
            LogWarnLevel(@"内容为空");
            return;
        }
        NSMutableAttributedString* attributString = [[NSMutableAttributedString alloc]initWithString:updateModel.updateContent];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        
        paragraphStyle.lineSpacing = 6;// 字体的行间距
        NSDictionary *dictAttr1 = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:kColor_TitleMainColor,NSKernAttributeName:@0,NSParagraphStyleAttributeName:paragraphStyle};
        [attributString addAttributes:dictAttr1 range:NSMakeRange(0,attributString.length)];
        self.contentLabel.attributedText = attributString;

    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}
@end
