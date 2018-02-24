//
//  WMShowViewController.m
//  copyYinke
//
//  Created by 王网明 on 2018/2/10.
//  Copyright © 2018年 王网明. All rights reserved.
//

#import "WMShowViewController.h"

@interface WMShowViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation WMShowViewController

- (NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[@"关注", @"热门", @"附近"];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}


/**
 设置导航栏
 */
- (void)initUI{
    [self setupNavigationViews];
    [self setupChildViewControllers];
}


/**
 设置导航栏
 */
- (void)setupNavigationViews{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
}

/**
 添加子控制器
 */
- (void)setupChildViewControllers{
    NSArray *vcNames = @[@"WMFouceViewController", @"WMHotViewController", @"WMNearViewController"];
    
    for (NSInteger i = 0; i < vcNames.count; i++) {
        NSString *vcName = vcNames[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        vc.title = self.dataSource[i];
        [self addChildViewController:vc];
    }
    
    //将自控制器的view加载到contentscrollview上
    //1.设置contentsize
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.dataSource.count, 0);
    
    //2.默认加载第二个页面
    self.contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
    [self scrollViewDidEndDecelerating:self.contentScrollView];
}

#pragma mark UIScrollViewDelegate
/**
 scrollView减速结束调用加载自控制器

 @param scrollView <#scrollView description#>
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = SCREEN_HEIGHT;
    
    CGFloat offset_x = scrollView.contentOffset.x;
    //获得加载的控制器
    NSInteger index = offset_x / width;
    
    UIViewController *vc = self.childViewControllers[index];
    
    //判断当前vc执行过viewdidload过,吐过被load过就返回，没加载过就将子控制器的view添加到scrollview
    if ([vc isViewLoaded]) return;
    
    vc.view.frame = CGRectMake(offset_x, 0, width, height);
    
    [scrollView addSubview:vc.view];
    
    
}
@end
