//
//  WMHttpTool.h
//  copyYinke
//
//  Created by 王网明 on 2018/2/26.
//  Copyright © 2018年 王网明. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^httpSuccessBlock)(id json);
typedef void(^httpFailBlock)(NSError *error);
typedef void(^httpDownloadProgressBlock)(CGFloat progress);
typedef void(^httpUploadProgressBlock)(CGFloat progress);

@interface WMHttpTool : NSObject

/**
 get请求

 @param pathUrl URL地址
 @param params 请求参数
 @param success 请求成功 (返回NSDictionary 或者 NSArray)
 @param failure 请求失败 (返回NSError)
 */
+ (void)getWithUrl:(NSString *)pathUrl
            params:(NSDictionary *)params
           success:(httpSuccessBlock)success
           failure:(httpFailBlock)failure;

/**
 post请求

 @param pathUrl URL地址
 @param params 请求参数
 @param success 请求成功 (返回NSDictionary 或者 NSArray)
 @param failure 请求失败 (返回NSError)
 */
+ (void)postWithUrl:(NSString *)pathUrl
          params:(NSDictionary *)params
         success:(httpSuccessBlock)success
         failure:(httpFailBlock)failure;

/**
 下载文件

 @param pathUrl URL地址
 @param success 请求成功 (返回NSDictionary 或者 NSArray)
 @param failure 请求失败 (返回NSError)
 @param progress 下载进度
 */
+ (void)downloadWithUrl:(NSString *)pathUrl
                success:(httpSuccessBlock)success
                failure:(httpFailBlock)failure
               progress:(httpDownloadProgressBlock)progress;


/**
 上传文件

 @param path 文件地址
 @param params 参数
 @param imagekey imageKey
 @param image image对象
 @param success 上传成功
 @param failure 上传失败
 @param progress 上传进度
 */
+ (void)uploadImageWithPath:(NSString *)path
                     params:(NSDictionary *)params
                  thumbName:(NSString *)imagekey
                      image:(UIImage *)image
                    success:(httpSuccessBlock)success
                    failure:(httpFailBlock)failure
                   progress:(httpUploadProgressBlock)progress;

@end
