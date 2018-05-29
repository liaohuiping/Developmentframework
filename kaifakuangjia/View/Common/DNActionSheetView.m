//
//  DNActionSheetView.m
//  WheatField
//
//  Created by dotnar on 2017/6/14.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNActionSheetView.h"


@interface DNActionSheetView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView* actionTableView;
@property (nonatomic,strong) NSArray* actionArr;
@end

@implementation DNActionSheetView

-(NSArray *)actionArr{
    if (!_actionArr) {
        _actionArr = [NSArray array];
    }
    return _actionArr;
}

-(UITableView *)actionTableView{
    if (!_actionTableView) {
        _actionTableView = [[UITableView alloc]init];
        _actionTableView.delegate = self;
        _actionTableView.dataSource = self;
        _actionTableView.backgroundColor = [UIColor whiteColor];
        _actionTableView.separatorColor = kColor_SeparateLineColor;
        _actionTableView.bounces = NO;
        _actionTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    
    return _actionTableView;
}

-(instancetype)initWithFrame:(CGRect)frame withActionArr:(NSArray*)actionArr{
    self = [super initWithFrame:frame];
    if (self) {
        self.actionArr  = actionArr;
        self.backgroundColor = kColor_AlphaViewColor;
        [self setupView];
        [self setupLayout];
    }
    return self;
}


#pragma mark -- setupView
-(void)setupView{
    [self addSubview:self.actionTableView];
}

-(void)setupLayout{
    [self.actionTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        if (kIPhoneXinch) {
            make.height.mas_equalTo(45*self.actionArr.count+kIphonexBottomAdd);
        }
        else{
            make.height.mas_equalTo(45*self.actionArr.count);
        }
        
    }];
}


#pragma mark -- delegate datasource

#pragma mark -- tableView delegate  datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.actionArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID = KCellID_DefaultTabCell;
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [self.actionArr objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = kColor_TitleMainColor;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (self.cellDidSelected) {
        self.cellDidSelected(indexPath);
    }
}


-(void)viewDidLayoutSubviews
{
    if ([self.actionTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.actionTableView setSeparatorInset:UIEdgeInsetsMake(0,kLeftInterval,0,kRightInterval)];
    }
    
    if ([self.actionTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.actionTableView setLayoutMargins:UIEdgeInsetsMake(0,kLeftInterval,0,kRightInterval)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0,kLeftInterval,0,kRightInterval)];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsMake(0,kLeftInterval,0,kRightInterval)];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.otherViewTouched) {
        self.otherViewTouched();
    }
}

@end
