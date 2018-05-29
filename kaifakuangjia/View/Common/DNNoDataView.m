//
//  DNNoDataView.m
//  WheatField
//
//  Created by dotnar on 2017/5/26.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNNoDataView.h"

@interface DNNoDataView ()
@property (nonatomic,strong) UIImageView* noContentImageView;
@property (nonatomic,strong) UILabel* remindLabel;
@end

@implementation DNNoDataView
-(UIImageView *)noContentImageView{
    if (!_noContentImageView) {
        _noContentImageView = [[UIImageView alloc]init];
        _noContentImageView.image = [UIImage imageNamed:kImage_NoData];
    }
    return _noContentImageView;
}

-(UILabel *)remindLabel{
    if (!_remindLabel) {
        _remindLabel = [[UILabel alloc]init];
        _remindLabel.textAlignment = NSTextAlignmentCenter;
        _remindLabel.textColor = kDNColorFromRGB(0xB3B3B3);
        _remindLabel.font = [UIFont systemFontOfSize:20];
        _remindLabel.text = Localized(kText_NoData);
    }
    return _remindLabel;
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
    [self addSubview:self.noContentImageView];
    [self addSubview:self.remindLabel];
}

-(void)setupLayout{

    
    [self.remindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(self.noContentImageView.mas_bottom).mas_offset(5*self.frame.size.height/640.0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
    
    [self.noContentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self).mas_offset(-60*self.frame.size.height/640.0);
        make.size.mas_equalTo(CGSizeMake(315*self.frame.size.width/375, 217*self.frame.size.height/640.0));
    }];
}

@end
