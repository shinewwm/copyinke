//
//  WMBaseHandler.h
//  copyYinke
//
//  Created by 王网明 on 2018/2/27.
//  Copyright © 2018年 王网明. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 处理完成事件
 */
typedef void(^CompleteBlock)();

/**
 处理成功

 @param obj 成功数据
 */
typedef void(^SuccessBlock)(id obj);

/**
 处理失败

 @param obj 失败数据
 */
typedef void(^FailureBlock)(id obj);

@interface WMBaseHandler : NSObject

@end
