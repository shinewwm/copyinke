//
//  WMTabbar.m
//  copyYinke
//
//  Created by 王网明 on 2018/2/10.
//  Copyright © 2018年 王网明. All rights reserved.
//

#import "WMTabbar.h"

@interface  WMTabbar ()

@property (nonatomic, strong) UIImageView *tabbarBackground;

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, strong) UIButton *cameraItem;

/**
 记录上个选中
 */
@property (nonatomic,strong) UIButton *lastItem;

@end

@implementation WMTabbar

- (UIButton *)cameraItem{
    if (!_cameraItem) {
        _cameraItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraItem setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        _cameraItem.tag = WMItemTypeLaunch;
        [_cameraItem addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraItem;
}

- (NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[@"tab_live", @"tab_me"];
    }
    return _dataSource;
}

- (UIImageView *)tabbarBackground{
    if (!_tabbarBackground) {
        _tabbarBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
        
    }
    return _tabbarBackground;
}

/**
 初始化

 @param frame <#frame description#>
 @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubview];
    }
    return self;
}

/**
 加载子控件
 */
- (void)setupSubview{
    //加载背景
    [self addSubview:self.tabbarBackground];
    //加载item
    for (NSInteger i = 0; i < self.dataSource.count; i++) {
        UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //不让图片在高亮状态下改变
        item.adjustsImageWhenHighlighted = NO;
        [item setImage:[UIImage imageNamed:self.dataSource[i]] forState:UIControlStateNormal];
        [item setImage:[UIImage imageNamed:[self.dataSource[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
        [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        item.tag = WMItemTypeLive + i;
        
        if (i == 0) {
            item.selected = YES;
            self.lastItem = item;
        }
        
        [self addSubview:item];
    }
    
    //添加直播按钮
    [self addSubview:self.cameraItem];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.tabbarBackground.frame = self.bounds;
    CGFloat width = self.bounds.size.width / self.dataSource.count;
    for (NSInteger i = 0; i < [self subviews].count; i++) {
        UIView *btn = [self subviews][i];
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.frame = CGRectMake((btn.tag - WMItemTypeLive) * width, 0, width, self.frame.size.height);
        }
    }
    
    [_cameraItem sizeToFit];
    self.cameraItem.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height - 50);
}

/**
 按钮点击事件

 @param item item description
 */
- (void)itemClick:(UIButton *)item{
    if ([self.delegate respondsToSelector:@selector(tabbar:chlickButton:)]) {
        [self.delegate tabbar:self chlickButton:item.tag];
    }
    
//    if (self.block) {
//        self.block(self, item.tag);
//    }
    
    if (item.tag == 10) {
        return;
    }
    
    self.lastItem.selected = NO;
    item.selected = YES;
    self.lastItem = item;
    
    //执行动画
    [UIView animateWithDuration:0.2 animations:^{
        //放大1.2倍
        item.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            //回复原始状态
            item.transform = CGAffineTransformIdentity;
        }];
    }];
}

@end
