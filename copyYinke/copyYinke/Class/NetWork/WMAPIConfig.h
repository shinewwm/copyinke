//
//  WMAPIConfig.h
//  copyYinke
//
//  Created by 王网明 on 2018/2/26.
//  Copyright © 2018年 王网明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMAPIConfig : NSObject

//http://openapi.busi.inke.cn/open-expand-api?origin=1000400001&timestamp=1463394863&sig=498af6666a534a251b8ec01453b44053

//http://openapi.busi.inke.cn/open-expand-api?openid=58111E43E59F1506C993713FC83D0270&platform=inke&appid=1000400001&timestamp=1463394863&sig=498af6666a534a251b8ec01453b44053

//服务器地址
#define SERVER_HOST @"http://openapi.busi.inke.cn/"

//大厅热门接口
#define API_HOTLIVE @"open-expand-api?origin=1000400001&timestamp=1463394863&sig=498af6666a534a251b8ec01453b44053" //?origin=1000400001&timestamp=1463394863&sig=498af6666a534a251b8ec01453b44053

//关注列表
#define API_FOCUS @"open-expand-api" //?openid=58111E43E59F1506C993713FC83D0270&platform=inke&appid=1000400001&timestamp=1463394863&sig=498af6666a534a251b8ec01453b44053

@end
