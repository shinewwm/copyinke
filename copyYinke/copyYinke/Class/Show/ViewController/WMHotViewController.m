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

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation WMHotViewController

#pragma mark 懒加载
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

#pragma mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self loadData];
}

- (void)initUI{
    
}

- (void)loadData{
    [WMShowHandler executeGetHotShowTaskWithSuccess:^(id obj) {
        [self.dataSource addObjectsFromArray:obj];
        [self.tableView reloadData];
    } failure:^(id obj) {
        NSLog(@"%@",obj);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
