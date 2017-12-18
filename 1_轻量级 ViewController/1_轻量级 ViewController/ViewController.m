//
//  ViewController.m
//  1_轻量级 ViewController
//
//  Created by  NorthCity on 2017/12/18.
//  Copyright © 2017年  NorthCity. All rights reserved.
//

#import "ViewController.h"
#import "CGStore.h"
#import "CGTableViewDataSource.h"
#import "CGPhotoCell+ConfigForPhoto.h"

static NSString * const kCellIdentifier = @"nameCellIdentifier";

@interface ViewController () <UITableViewDelegate>
@property(nonatomic, strong) UITableView *nameTbaleView;
@property(nonatomic, strong) CGTableViewDataSource *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createTableView {
    [self.view addSubview:self.nameTbaleView];
    self.nameTbaleView.frame = self.view.bounds;
}

#pragma mark - Getters

- (UITableView *)nameTbaleView {
    if (!_nameTbaleView) {
        _nameTbaleView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_nameTbaleView registerClass:[CGPhotoCell class] forCellReuseIdentifier:kCellIdentifier];
        _nameTbaleView.dataSource = self.dataSource;
        _nameTbaleView.delegate = self;
    }
    return _nameTbaleView;
}

- (CGTableViewDataSource *)dataSource {
    if (!_dataSource) {
        CGTableViewConfigCellBlock configBlock = ^(CGPhotoCell *cell, Photo *photo) {
            [cell configCell:photo];
        };
        _dataSource = [[CGTableViewDataSource alloc] initWithItmes:[CGStore store].photos
                                                    cellIdentifier:kCellIdentifier
                                                   configCellBlock:configBlock];
    }
    return _dataSource;
}
@end
