//
//  WMShowTopView.m
//  copyYinke
//
//  Created by 王网明 on 2018/2/24.
//  Copyright © 2018年 王网明. All rights reserved.
//

#import "WMShowTopView.h"


@interface WMShowTopView ()

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation WMShowTopView

- (NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}


/**
 初始化titleview

 @param frame <#frame description#>
 @param titles titleName数组
 @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame withTitleName:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpSubviews:titles];
    }
    return self;
}

- (void)setUpSubviews:(NSArray *)titles{
    CGFloat btnW = self.width / titles.count;
    CGFloat btnH = self.height;
    for (NSInteger i = 0; i < titles.count; i++) {
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        titleBtn.tag = i;
        [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        titleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        titleBtn.frame = CGRectMake(i * btnW , 0, btnW, btnH);
        
        [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:titleBtn];
        
        [self.buttons addObject:titleBtn];
        
        if (i == 1) {
            CGFloat h = 1.5;
            CGFloat y = 40;
            
            [titleBtn.titleLabel sizeToFit];
            
            self.lineView = [[UIView alloc] init];
            self.lineView.backgroundColor = [UIColor whiteColor];
            self.lineView.height = h;
            self.lineView.width = titleBtn.titleLabel.width;
            self.lineView.top = y;
            self.lineView.centerX = titleBtn.centerX;
            [self addSubview:self.lineView];
        }
    }
}

/**
 点击顶部按钮

 @param titleBtn 切换控制器
 */
- (void)titleClick:(UIButton *)titleBtn{
    if (self.block) {
        self.block(titleBtn.tag);
    }
    [self scrolling:titleBtn.tag];
}

- (void)scrolling:(NSInteger)index{
    UIButton *titleBtn = self.buttons[index];
    [UIView animateWithDuration:0.3 animations:^{
        self.lineView.centerX = titleBtn.centerX;
    }];
}

@end
