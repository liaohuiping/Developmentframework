//
//  DNLoadingView.m
//  WheatField
//
//  Created by dotnar on 2017/6/15.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNLoadingView.h"
#import "YLGIFImage.h"
#import "YLImageView.h"
#import "UIView+AddShadowLayer.h"



@interface DNLoadingView ()
@property (nonatomic,strong) UIImageView* backImageView;
@property (nonatomic,strong) YLImageView* gifImageView;

@end

@implementation DNLoadingView

-(UIView *)backImageView{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc]init];
        _backImageView.image =  [UIImage imageNamed:kImage_LoadingBackView];
        
    }
    return _backImageView;
}
-(YLImageView *)gifImageView{
    if (!_gifImageView) {
        _gifImageView = [[YLImageView alloc]init];
        _gifImageView.image = [YLGIFImage imageNamed:kImage_GifLoading];
        _gifImageView.loopCountdown = 1000;
    }
    return _gifImageView;
}


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setupView];
        [self setupLayout];
    }
    return self;
}


#pragma mark -- setupView
-(void)setupView{
   
    [self addSubview:self.backImageView];
    [self.backImageView addSubview:self.gifImageView];
}

-(void)setupLayout{
 
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(85,85));
    }];
    [self.gifImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.backImageView);
        make.centerY.mas_equalTo(self.backImageView);
        make.size.mas_equalTo(CGSizeMake(85, 85));
    }];

}

@end
