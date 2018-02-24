//
//  WMShowTopView.h
//  copyYinke
//
//  Created by 王网明 on 2018/2/24.
//  Copyright © 2018年 王网明. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^showTopBlock)(NSInteger tag);

@interface WMShowTopView : UIView

- (instancetype)initWithFrame:(CGRect)frame withTitleName:(NSArray *)titles;

- (void)scrolling:(NSInteger)index;

@property (nonatomic, copy) showTopBlock block;



@end
