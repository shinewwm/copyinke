//
//  WMHotViewController.m
//  copyYinke
//
//  Created by 王网明 on 2018/2/11.
//  Copyright © 2018年 王网明. All rights reserved.
//

#import "WMHotViewController.h"
#import "WMShowHandler.h"

@interface WMHotViewController ()

@end

@implementation WMHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self loadData];
}

- (void)initUI{
    
}

- (void)loadData{
    [WMShowHandler executeGetHotShowTaskWithSuccess:^(id obj) {
        NSLog(@"%@",obj);
    } failure:^(id obj) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
