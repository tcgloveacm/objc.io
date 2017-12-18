//
//  CGTableViewDataSource.m
//  1_轻量级 ViewController
//
//  Created by  NorthCity on 2017/12/18.
//  Copyright © 2017年  NorthCity. All rights reserved.
//

#import "CGTableViewDataSource.h"
@interface CGTableViewDataSource () 
@property(nonatomic, strong) NSArray *items;
@property(nonatomic, copy) NSString *cellIdentifier;
@property(nonatomic, copy) CGTableViewConfigCellBlock configCellBlock;
@end

@implementation CGTableViewDataSource

- (instancetype)initWithItmes:(NSArray *)anItems
               cellIdentifier:(NSString *)aCellIdentifier
              configCellBlock:(CGTableViewConfigCellBlock)anBlock {
    self = [super init];
    if (self) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configCellBlock = anBlock;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[indexPath.row];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    if (cell) {
        id item = [self itemAtIndexPath:indexPath];
        self.configCellBlock(cell, item);
    }
    return cell;
}


@end
