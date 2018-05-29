//
//  DNViewModelClass.m
//  WheatField
//
//  Created by dotnar on 2017/5/3.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNViewModelClass.h"


@implementation DNViewModelClass

-(void)dealloc
{
    LogInfoLevel(@"Delloc ->%@",NSStringFromClass(self.class));
}

#pragma mark -- 接收穿过来的block
-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock
{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failurBlcok = failureBlock;
}
#pragma 获取到正确的数据，对正确的数据进行处理
-(void)fetchValueSuccessWithResponse: (DNResponseModel*) returnValue{
    if (self.returnBlock) {
        self.returnBlock(returnValue);
    }
}

#pragma 对ErrorCode进行处理
-(void) errorCodeWithReponse: (DNResponseModel*) errorDic{
    if (self.errorBlock) {
        self.errorBlock(errorDic);
    }
}

#pragma 对网路异常进行处理
-(void) netFailureWithError:(NSError*)error{
    if (self.failurBlcok) {
        self.failurBlcok(error);
    }
}

-(void)cancelTheRequestWithURL:(NSString *)url{
    [DNNetRequest cancelRequestWithURL:url];
}
@end
