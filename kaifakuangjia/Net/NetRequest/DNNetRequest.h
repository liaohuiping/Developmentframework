//
//  DNNetRequest.h
//  WheatField
//
//  Created by dotnar on 2017/5/31.
//  Copyright © 2017年 dotnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNNetRequestClass.h"


@interface DNNetRequest : NSObject
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^HttpStatusCode) (int httpStatusCode);
typedef void (^ErrorCodeBlock) (id errorCode);

typedef void (^FailureBlock)(NSError* netError);


/*!
 *  @author Justin, 17-05-03 11:05:36
 *
 *  GET请求接口，若不指定baseurl，可传完整的url
 *
 *  @param url     接口路径，如/path/getArticleList
 *  @param refreshCache 是否刷新缓存。由于请求成功也可能没有数据，对于业务失败，只能通过人为手动判断
 *  @param params  接口中所需要的拼接参数，如@{"categoryid" : @(12)}
 *  @param success 接口成功请求到数据的回调
 *  @param fail    接口请求数据失败的回调
 *
 *  @return 返回的对象中有可取消请求的API
 */
+ (void)getWithUrl:(NSString *)url
      refreshCache:(BOOL)refreshCache
WithReturnValeuBlock: (ReturnValueBlock) block
WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
  WithFailureBlock: (FailureBlock) failureBlock;
// 多一个params参数
+ (void)getWithUrl:(NSString *)url
      refreshCache:(BOOL)refreshCache
            params:(NSDictionary *)params
WithReturnValeuBlock: (ReturnValueBlock) block
WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
  WithFailureBlock: (FailureBlock) failureBlock;
// 多一个带进度回调
+ (void)getWithUrl:(NSString *)url
      refreshCache:(BOOL)refreshCache
            params:(NSDictionary *)params
          progress:(DNGetProgress)progress
WithReturnValeuBlock: (ReturnValueBlock) block
WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
  WithFailureBlock: (FailureBlock) failureBlock;

/*!
 *  @author Justin, 17-05-03 11:05:36
 *
 *  POST请求接口，若不指定baseurl，可传完整的url
 *
 *  @param url     接口路径，如/path/getArticleList
 *  @param params  接口中所需的参数，如@{"categoryid" : @(12)}
 *  @param success 接口成功请求到数据的回调
 *  @param fail    接口请求数据失败的回调
 *
 *  @return 返回的对象中有可取消请求的API
 */
+ (void)postWithUrl:(NSString *)url
       refreshCache:(BOOL)refreshCache
             params:(NSDictionary *)params
WithReturnValeuBlock: (ReturnValueBlock) block
 WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
   WithFailureBlock: (FailureBlock) failureBlock;

+ (void)postWithUrl:(NSString *)url
       refreshCache:(BOOL)refreshCache
             params:(NSDictionary *)params
           progress:(DNPostProgress)progress
WithReturnValeuBlock: (ReturnValueBlock) block
 WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
   WithFailureBlock: (FailureBlock) failureBlock;
/**
 *	@author Justin, 17-05-03 11:05:36
 *
 *	图片上传接口，若不指定baseurl，可传完整的url
 *
 *	@param image			图片对象
 *	@param url				上传图片的接口路径，如/path/images/
 *	@param filename		给图片起一个名字，默认为当前日期时间,格式为"yyyyMMddHHmmss"，后缀为`jpg`
 *	@param name				与指定的图片相关联的名称，这是由后端写接口的人指定的，如imagefiles
 *	@param mimeType		默认为image/jpeg
 *	@param parameters	参数
 *	@param progress		上传进度
 *	@param success		上传成功回调
 *	@param fail				上传失败回调
 *
 *	@return
 */
+ (void)uploadWithImage:(UIImage *)image
                    url:(NSString *)url
               filename:(NSString *)filename
                   name:(NSString *)name
               mimeType:(NSString *)mimeType
             parameters:(NSDictionary *)parameters
               progress:(DNUploadProgress)progress
   WithReturnValeuBlock: (ReturnValueBlock) block
     WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
       WithFailureBlock: (FailureBlock) failureBlock;

/**
 *	@author Justin, 17-05-03 11:05:36
 *
 *	上传文件操作
 *
 *	@param url						上传路径
 *	@param uploadingFile	待上传文件的路径
 *	@param progress			上传进度
 *	@param success				上传成功回调
 *	@param fail					上传失败回调
 *
 *	@return
 */
+ (void)uploadFileWithUrl:(NSString *)url
            uploadingFile:(NSString *)uploadingFile
                 progress:(DNUploadProgress)progress
     WithReturnValeuBlock: (ReturnValueBlock) block
       WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
         WithFailureBlock: (FailureBlock) failureBlock;


/*!
 *  @author Justin, 17-05-03 11:05:36
 *
 *  下载文件
 *
 *  @param url           下载URL
 *  @param saveToPath    下载到哪个路径下
 *  @param progressBlock 下载进度
 *  @param success       下载成功后的回调
 *  @param failure       下载失败后的回调
 */
+ (void)downloadWithUrl:(NSString *)url
             saveToPath:(NSString *)saveToPath
               progress:(DNDownloadProgress)progressBlock
   WithReturnValeuBlock: (ReturnValueBlock) block
     WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
       WithFailureBlock: (FailureBlock) failureBlock;

/**
 *  @author Justin, 17-05-31 11:05:54
 *
 *  取消所有请求
 */
+ (void)cancelAllRequest;
/**
 *	@author Justin
 *
 *	取消某个请求。如果是要取消某个请求，最好是引用接口所返回来的DNURLSessionTask对象，
 *  然后调用对象的cancel方法。如果不想引用对象，这里额外提供了一种方法来实现取消某个请求
 *
 *	@param url				URL，可以是绝对URL，也可以是path（也就是不包括baseurl）
 */
+ (void)cancelRequestWithURL:(NSString*)url;
@end
