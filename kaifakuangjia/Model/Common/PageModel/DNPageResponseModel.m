//
//  DNPageResponseModel.m
//  WheatField
//
//  Created by dotnar on 2017/6/19.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNPageResponseModel.h"

@implementation DNPageResponseModel
+(NSDictionary*)mj_replacedKeyFromPropertyName{
    return @{@"pagesMsg":@"pages"};
}

-(void)setPagesMsg:(DNPageModel *)pagesMsg{
    if ([pagesMsg isKindOfClass:[NSDictionary class]]) {
        _pagesMsg  =[DNPageModel mj_objectWithKeyValues:pagesMsg];
    }
    else if ([pagesMsg isKindOfClass:[DNPageModel class]]){
        _pagesMsg = pagesMsg;
    }
    else{
        _pagesMsg = pagesMsg;
        LogErrorLevel(@"pagesMsg数据类型错误");
    }
}
@end
