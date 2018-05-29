//
//  DNNetRequest.m
//  WheatField
//
//  Created by dotnar on 2017/5/31.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import "DNNetRequest.h"
#import "DNResponseModel.h"
#import "DNNetRequestClass.h"
#import "DNAccountService.h"
#import "DNDateFormatter.h"
#import "DNWindowView.h"
#import "DNDictionaryString.h"
#import "CoreArchive.h"


@implementation DNNetRequest
+ (void)getWithUrl:(NSString *)url
      refreshCache:(BOOL)refreshCache
WithReturnValeuBlock: (ReturnValueBlock) block
WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
  WithFailureBlock: (FailureBlock) failureBlock{
    [DNNetRequestClass getWithUrl:url refreshCache:refreshCache success:^(id response) {
        DNResponseModel* responseModel = [DNNetRequest dealWithResponseWithData:response withUrl:url];
        if (responseModel.isSuccess == YES) {
            block(responseModel);
        }
        else{
            errorBlock(responseModel);
        }

    } fail:^(NSError *error) {
                [DNNetRequest dealWithNetFailWithError:error];
        failureBlock(error);
    }];
}

+ (void)getWithUrl:(NSString *)url
      refreshCache:(BOOL)refreshCache
            params:(NSDictionary *)params
WithReturnValeuBlock: (ReturnValueBlock) block
WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
  WithFailureBlock: (FailureBlock) failureBlock{
    [DNNetRequestClass getWithUrl:url refreshCache:refreshCache params:[DNNetRequest dealWithRequestWithParams:params andUrl:url] success:^(id response) {
        DNResponseModel* responseModel = [DNNetRequest dealWithResponseWithData:response withUrl:url];
        if (responseModel.isSuccess == YES) {
            block(responseModel);
        }
        else{
            errorBlock(responseModel);
        }

    } fail:^(NSError *error) {
                [DNNetRequest dealWithNetFailWithError:error];
        failureBlock(error);
    }];
}

+ (void)getWithUrl:(NSString *)url
      refreshCache:(BOOL)refreshCache
            params:(NSDictionary *)params
          progress:(DNGetProgress)progress
WithReturnValeuBlock: (ReturnValueBlock) block
WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
  WithFailureBlock: (FailureBlock) failureBlock{
    [DNNetRequestClass getWithUrl:url refreshCache:refreshCache params:[DNNetRequest dealWithRequestWithParams:params andUrl:url] progress:^(int64_t bytesRead, int64_t totalBytesRead) {
        
    } success:^(id response) {
        DNResponseModel* responseModel = [DNNetRequest dealWithResponseWithData:response withUrl:url];
        if (responseModel.isSuccess == YES) {
            block(responseModel);
        }
        else{
            errorBlock(responseModel);
        }

    } fail:^(NSError *error) {
                [DNNetRequest dealWithNetFailWithError:error];
        failureBlock(error);
    }];
    
}

+ (void)postWithUrl:(NSString *)url
       refreshCache:(BOOL)refreshCache
             params:(NSDictionary *)params
WithReturnValeuBlock: (ReturnValueBlock) block
 WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
   WithFailureBlock: (FailureBlock) failureBlock{
    
    [DNNetRequestClass postWithUrl:url refreshCache:refreshCache params:[DNNetRequest dealWithRequestWithParams:params andUrl:url] success:^(id response) {

        DNResponseModel* responseModel = [DNNetRequest dealWithResponseWithData:response withUrl:url];
        if (responseModel.isSuccess == YES) {
            block(responseModel);
        }
        else{
            errorBlock(responseModel);
            if ([responseModel.code isEqualToString:kText_ResponeCodeOverdue]) {
                
                [kUserDefaults removeObjectForKey:kUserDefaults_UserId];
                [kUserDefaults removeObjectForKey:kUserDefaults_Email];
                [kUserDefaults removeObjectForKey:kUserDefaults_Token];
                [kUserDefaults removeObjectForKey:kUserDefaults_LoginPassword];
                [kUserDefaults removeObjectForKey:kUserDefaults_HeadImageFile];
                [kUserDefaults removeObjectForKey:kUserDefaults_Nickname];
                [kUserDefaults removeObjectForKey:kUserDefaults_Phone];
                [kUserDefaults removeObjectForKey:kUserDefaults_CountryType];
                [kUserDefaults removeObjectForKey:kUserDefaults_is_hand];
                [kUserDefaults removeObjectForKey:kUserDefaults_isopen_hand];
                [CoreArchive removeStrForKey:@"CoreLockPWDKey"];
                [kUserDefaults synchronize];
                
                [kNotificationCenter postNotificationName:kNotification_ChangeWindowRoot object:nil];
                [DNNetRequest removeJpushTagAndAlias];
            }
        }
    } fail:^(NSError *error) {
        [DNNetRequest dealWithNetFailWithError:error];
        failureBlock(error);
    }];
    
}

+ (void)postWithUrl:(NSString *)url
       refreshCache:(BOOL)refreshCache
             params:(NSDictionary *)params
           progress:(DNPostProgress)progress
WithReturnValeuBlock: (ReturnValueBlock) block
 WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
   WithFailureBlock: (FailureBlock) failureBlock{
    [DNNetRequestClass postWithUrl:url refreshCache:refreshCache params:[DNNetRequest dealWithRequestWithParams:params andUrl:url] progress:^(int64_t bytesRead, int64_t totalBytesRead) {
        
    } success:^(id response) {
        DNResponseModel* responseModel = [DNNetRequest dealWithResponseWithData:response withUrl:url];
        if (responseModel.isSuccess == YES) {
            block(responseModel);
        }
        else{
            errorBlock(responseModel);
        }

    } fail:^(NSError *error) {
        [DNNetRequest dealWithNetFailWithError:error];
        failureBlock(error);
    }];
}


+ (void)uploadWithImage:(UIImage *)image
                    url:(NSString *)url
               filename:(NSString *)filename
                   name:(NSString *)name
               mimeType:(NSString *)mimeType
             parameters:(NSDictionary *)parameters
               progress:(DNUploadProgress)progress
   WithReturnValeuBlock: (ReturnValueBlock) block
     WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
       WithFailureBlock: (FailureBlock) failureBlock{
    [DNNetRequestClass uploadWithImage:image url:url filename:filename name:name mimeType:mimeType parameters:[DNNetRequest dealWithRequestWithParams:parameters andUrl:url] progress:^(int64_t bytesWritten, int64_t totalBytesWritten) {
        
    } success:^(id response) {
        DNResponseModel* responseModel = [DNNetRequest dealWithResponseWithData:response withUrl:url];
        if (responseModel.isSuccess == YES) {
            block(responseModel);
        }
        else{
            errorBlock(responseModel);
        }

    } fail:^(NSError *error) {
                [DNNetRequest dealWithNetFailWithError:error];
        failureBlock(error);
    }];
}


+ (void)uploadFileWithUrl:(NSString *)url
            uploadingFile:(NSString *)uploadingFile
                 progress:(DNUploadProgress)progress
     WithReturnValeuBlock: (ReturnValueBlock) block
       WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
         WithFailureBlock: (FailureBlock) failureBlock{
    [DNNetRequestClass uploadFileWithUrl:url uploadingFile:uploadingFile progress:^(int64_t bytesWritten, int64_t totalBytesWritten) {
        
    } success:^(id response) {
        DNResponseModel* responseModel = [DNNetRequest dealWithResponseWithData:response withUrl:url];
        if (responseModel.isSuccess == YES) {
            block(responseModel);
        }
        else{
            errorBlock(responseModel);
        }

    } fail:^(NSError *error) {
                [DNNetRequest dealWithNetFailWithError:error];
        failureBlock(error);
    }];
    
}



+ (void)downloadWithUrl:(NSString *)url
             saveToPath:(NSString *)saveToPath
               progress:(DNDownloadProgress)progressBlock
   WithReturnValeuBlock: (ReturnValueBlock) block
     WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
       WithFailureBlock: (FailureBlock) failureBlock{
    [DNNetRequestClass downloadWithUrl:url saveToPath:saveToPath progress:^(int64_t bytesRead, int64_t totalBytesRead) {
        
    } success:^(id response) {
        DNResponseModel* responseModel = [DNNetRequest dealWithResponseWithData:response withUrl:url];
        if (responseModel.isSuccess == YES) {
            block(responseModel);
        }
        else{
            errorBlock(responseModel);
        }

    } failure:^(NSError *error) {
                [DNNetRequest dealWithNetFailWithError:error];
        failureBlock(error);
    }];
}


+(void)cancelAllRequest{
    [DNNetRequestClass cancelAllRequest];
}

+(void)cancelRequestWithURL:(NSString *)url{
    [DNNetRequestClass cancelRequestWithURL:url];
}
#pragma mark 返回结果处理
+(DNResponseModel*)dealWithResponseWithData:(id)response withUrl:(NSString*)url{
    DNResponseModel* responseModel = nil;
    if ([response isKindOfClass:[NSDictionary class]]) {
        LogDebugLevel(@"%@\n%@",url,response);
        NSMutableDictionary* dic = [response mutableCopy];
//  //      中英文错误信息提示转化（中文取msg，英文将 dd 字段映射到msg上）;
//        if (!KLanguageChinese&&!kStringIsEmpty([response objectForKey:@"enMsg"])) {
//            [dic setValue:[response objectForKey:@"enMsg"] forKey:@"msg"];
//        }
        responseModel = [DNResponseModel mj_objectWithKeyValues:dic];
    }
    else{
        LogErrorLevel(@"网络请求返回数据格式错误");
    }
    return responseModel;
}

#pragma mark 请求前的处理
+(NSDictionary*)dealWithRequestWithParams:(NSDictionary*)params andUrl:(NSString*)url{
    //LogDebugLevel(@"请求参数%@",params);
    NSMutableDictionary* mutableDic = [DNNetRequest addCommonParamsWithOriginDic:params.mutableCopy];
    LogDebugLevel(@"请求的url：%@\n添加通用参数后%@",url,mutableDic);
    return mutableDic;
}

+(NSMutableDictionary*)addCommonParamsWithOriginDic:(NSMutableDictionary*)params{
    NSString* appLaguageString = kNetParamsValueLangEn_us;
    if (KLanguageChinese) {//开头匹配
        appLaguageString = kNetParamsValueLangZh_cn;
    }
    else{
       appLaguageString = kNetParamsValueLangEn_us;
    }
    NSMutableDictionary* commonDic = @{kNetParamsKeyLanguage:appLaguageString}.mutableCopy;
    
    //添加用户id
    if (!kStringIsEmpty([kUserDefaults objectForKey:kUserDefaults_UserId])&&[params objectForKey:kUserDefaults_UserId] == nil) {
        [commonDic setObject:[kUserDefaults objectForKey:kUserDefaults_UserId] forKey:kNetParamsKeyUser_id];
    }

    
    //添加用户token(单点登录)
    if (!kStringIsEmpty([kUserDefaults objectForKey:kUserDefaults_Token])&&[params objectForKey:kUserDefaults_Token] == nil) {
        [commonDic setObject:[kUserDefaults objectForKey:kUserDefaults_Token] forKey:kNetParamsKeyOnline_rifid];
    }
    else{
        //[commonDic setObject:@"" forKey:kNetParamsKeyOnline_rifid];
    }
    //添加app的类型 安卓、iOS
    [commonDic setObject:kNetParamsValueAppType forKey:kNetParamsKeyAppType];
    
    //设备uuid
    NSString* uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    if (!kStringIsEmpty(uuid)) {
        [commonDic setObject:uuid forKey:kNetParamsKeyImeicode];
    }
    else{
        LogErrorLevel(@"设备uuid为空")
    }
    
    //时间戳
    NSTimeInterval timeInterval = [[NSDate date ]timeIntervalSince1970];
    if (timeInterval > 0) {
        [commonDic setObject:[NSString stringWithFormat:@"%.0f",timeInterval] forKey:kNetParamsKeyTime];
    }
    else{
        LogErrorLevel(@"时间戳错误");
    }
    
    
    
    
    [params addEntriesFromDictionary:commonDic];
    //增加签名secretkey（拼接所有参数 排序 字母排序-> tianj appkey  md加密（两次） 转大写）
    NSString* secretkey = [DNNetRequest creatSecretkeyStringWithDic:params];
    if (!kStringIsEmpty(secretkey)) {
        [params addEntriesFromDictionary:@{kNetParamsKeySecretkey:secretkey}];
    }
    else{
        LogErrorLevel(@"secretkey签名错误");
    }
    
    
    return params;
}

+(void)dealWithNetFailWithError:(NSError*)error{
    LogErrorLevel(@"%@",error.description);
}

+(void)removeJpushTagAndAlias{
    [kNotificationCenter postNotificationName:kNotification_JpushServer object:@2];
}

+(NSString*)creatSecretkeyStringWithDic:(NSDictionary*)dic{
    NSMutableString* secretkey = [DNDictionaryString keyValueStringWithDict:dic];
    [secretkey appendString:[NSString stringWithFormat:@"&%@=%@",kNetParamsKeyAppkey,kNetParamsValueAppkey]];
    NSString* md5String = [DNDictionaryString md5WithString:[DNDictionaryString md5WithString:secretkey]];
    return [md5String uppercaseString];
}
@end
