//
//  DNPopMenuView.m
//  WheatField
//
//  Created by dotnar on 2017/6/12.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNPopMenuView.h"
#import "DNPopMenuModel.h"
@implementation DNPopMenuView

-(instancetype)initWithData:(NSArray*)dataArr{
    self = [super initOptionView];
    if (self) {
        self.vhShow = NO;
        self.optionType = MLMOptionSelectViewTypeArrow;
        self.edgeInsets = UIEdgeInsetsMake(65, 10, 10, 10);
        self.canEdit = NO;
        self.layer.masksToBounds = YES;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"DefaultCell"];
        self.optionCellHeight = ^{
            return 50.f;
        };
        __weak typeof(self) weakSelf = self;
        self.rowNumber = ^(){
            return (NSInteger)dataArr.count;
        };
        self.cell = ^(NSIndexPath *indexPath){
            UITableViewCell *cell = [weakSelf dequeueReusableCellWithIdentifier:@"DefaultCell"];
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            cell.textLabel.textColor = kColor_TitleMainColor;
            DNPopMenuModel* menuModel = dataArr[indexPath.row];
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            cell.textLabel.textColor = kColor_TitleMainColor;
            if (!kStringIsEmpty(menuModel.imageName)) {
                cell.imageView.image = [UIImage imageNamed:menuModel.imageName];
            }
            
            if (!kStringIsEmpty(menuModel.itemName)) {
                cell.textLabel.text = [NSString stringWithFormat:@"%@",menuModel.itemName];
            }
            return cell;
        };
    }
    return self;
}

@end
