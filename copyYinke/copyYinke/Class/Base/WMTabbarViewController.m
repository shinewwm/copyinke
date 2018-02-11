//
//  WMTabbarViewController.m
//  copyYinke
//
//  Created by 王网明 on 2018/2/10.
//  Copyright © 2018年 王网明. All rights reserved.
//

#import "WMTabbarViewController.h"
#import "WMTabbar.h"
#import "WMBaseNavViewController.h"
#import "WMLaunchViewController.h"

@interface WMTabbarViewController () <WMTabbarDelegate>

@property (nonatomic, strong) WMTabbar *wmtabbar;

@end

@implementation WMTabbarViewController

#pragma mark 懒加载
- (WMTabbar *)wmtabbar{
    if (!_wmtabbar) {
        _wmtabbar = [[WMTabbar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _wmtabbar.delegate = self;
    }
    return _wmtabbar;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewControllers];
    [self setuptabbar];
}

/**
 设置子控制器
 */
- (void)setupViewControllers{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"WMShowViewController", @"WMMeViewController"]];
    for (NSInteger i = 0; i < array.count; i++) {
        NSString *vcName = array[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        
        WMBaseNavViewController *nav = [[WMBaseNavViewController alloc] initWithRootViewController:vc];
        [array replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = array;
}

/**
 设置tabbar
 */
- (void)setuptabbar{
    [self.tabBar addSubview:self.wmtabbar];
    //删除tabbar的阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
}

#pragma mark WMTabbarDelegate
- (void)tabbar:(WMTabbar *)tabbar chlickButton:(WMItemType)index{
    if (index != WMItemTypeLaunch) {
        self.selectedIndex = index - WMItemTypeLive;
        return;
    }
    //开启模态视图
    WMLaunchViewController *lvc = [[WMLaunchViewController alloc] init];
    [self presentViewController:lvc animated:YES completion:^{
        
    }];
}

@end
