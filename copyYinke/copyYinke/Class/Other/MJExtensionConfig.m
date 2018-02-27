//
//  MJExtensionConfig.m
//  copyYinke
//
//  Created by 王网明 on 2018/2/27.
//  Copyright © 2018年 王网明. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "WMShowModel.h"

@implementation MJExtensionConfig

+ (void)load{
#pragma mark 如果使用NSObject调用这些方法，代表所有继承自NSObject的类都会生效
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID" : @"id"};
    }];
    [WMShowModel mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
}

@end
