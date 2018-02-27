//
//  WMTabbar.h
//  copyYinke
//
//  Created by 王网明 on 2018/2/10.
//  Copyright © 2018年 王网明. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,WMItemType){
    WMItemTypeLaunch = 10,//启动直播
    WMItemTypeLive = 100,//直播首页
    WMItemTypeMe,//我的
};

@class WMTabbar;

/**
 点击tabbaritem

 @param tabbar tabbar
 @param index WMItemType
 */
typedef void(^TabBlock)(WMTabbar *tabbar,WMItemType index);

@protocol WMTabbarDelegate <NSObject>

/**
 点击tabbaritem

 @param tabbar tabbar
 @param index WMItemType
 */
- (void)tabbar:(WMTabbar *)tabbar chlickButton:(WMItemType)index;

@end

@interface WMTabbar : UIView

@property (weak, nonatomic) id<WMTabbarDelegate> delegate;

@property (copy, nonatomic) TabBlock block;

@end
