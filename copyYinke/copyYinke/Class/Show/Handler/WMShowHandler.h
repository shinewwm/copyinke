//
//  WMShowHandler.h
//  copyYinke
//
//  Created by 王网明 on 2018/2/27.
//  Copyright © 2018年 王网明. All rights reserved.
//

#import "WMBaseHandler.h"

@interface WMShowHandler : WMBaseHandler

/**
 执行获取热门直播信息

 @param success success description
 @param failure failure description
 */
+ (void)executeGetHotShowTaskWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure;

@end
