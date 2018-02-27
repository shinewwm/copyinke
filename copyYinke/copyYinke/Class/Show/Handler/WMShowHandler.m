//
//  WMShowHandler.m
//  copyYinke
//
//  Created by 王网明 on 2018/2/27.
//  Copyright © 2018年 王网明. All rights reserved.
//

#import "WMShowHandler.h"
#import "WMHttpTool.h"
#import "WMShowModel.h"

@implementation WMShowHandler

+ (void)executeGetHotShowTaskWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure{
    
    [WMHttpTool getWithUrl:API_HOTLIVE params:nil success:^(id json) {
        if (![json[@"msg"] isEqualToString:@"OK"]) {
            failure(json);
        }else{
            //返回正确数据解析
            NSArray *radio_list = [WMShowModel mj_objectArrayWithKeyValuesArray:json[@"radio_list"]];
            
            success(radio_list);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}

@end
