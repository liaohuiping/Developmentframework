//
//  DNViewModelClass.h
//  WheatField
//
//  Created by dotnar on 2017/5/3.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNNetRequest.h"
#import "DNNetURL.h"
#import "DNResponseModel.h"

/**
 *  @author Justin, 17-05-03 10:05:36
 *
 *  发送网络模型基类
 */
typedef void (^ReturnValueBlock) (id returnValue);///<返回成功
typedef void (^ErrorCodeBlock) (id errorCode);///<返回错误代码
typedef void (^FailureBlock)(NSError* error);///<返回网络失败

@interface DNViewModelClass : NSObject

@property (nonatomic,strong) NSDictionary* responeDic;///<返回内容（state data）
@property (nonatomic,strong) NSDictionary* stateDic;///<返回的状态内容
@property (nonatomic,strong) NSDictionary* returnDic;///<返回成功后 data为dic 中的内容
@property (nonatomic,strong) NSArray* returnArr;///<返回成功后 data为dic中的内容
@property (nonatomic,strong) NSDictionary* errorDic;///<返回错误后 错误码；
@property (nonatomic,strong) NSDictionary* failurDic;///<返回失败后 错误码
@property (nonatomic,strong) ReturnValueBlock returnBlock;///<返回成功
@property (nonatomic,strong) ErrorCodeBlock errorBlock;///<返回错误代码
@property (nonatomic,strong) FailureBlock failurBlcok;///<返回网络失败


/**
 *  @author Justin, 17-05-03 10:05:05
 *
 *  传入交互的block块
 *
 *  @param returnBlock  返回成功
 *  @param errorBlock   返回错误代码
 *  @param failureBlock 返回网络失败
 */
-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock;

#pragma mark -
#pragma mark - 必须实现以下三个方法
#pragma 对ErrorCode进行处理
-(void) errorCodeWithReponse: (DNResponseModel*) errorDic;

#pragma 对网路异常进行处理
-(void)netFailureWithError:(NSError*)error;

#pragma 获取到正确的数据，对正确的数据进行处理
-(void)fetchValueSuccessWithResponse: (DNResponseModel*) returnValue;

#pragma mark -- 取消本次请求;
/**
 *	@author Justin
 *
 *	取消某个请求。如果是要取消某个请求，最好是引用接口所返回来的DNURLSessionTask对象，
 *  然后调用对象的cancel方法。如果不想引用对象，这里额外提供了一种方法来实现取消某个请求
 *
 *	@param url				URL，可以是绝对URL，也可以是path（也就是不包括baseurl）
 */
-(void)cancelTheRequestWithURL:(NSString*)url;
@end
