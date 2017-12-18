//
//  CGTableViewDataSource.h
//  1_轻量级 ViewController
//
//  Created by  NorthCity on 2017/12/18.
//  Copyright © 2017年  NorthCity. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CGTableViewConfigCellBlock)(id cell, id item);
@interface CGTableViewDataSource : NSObject <UITableViewDataSource>
- (instancetype)initWithItmes:(NSArray *)anItems
               cellIdentifier:(NSString *)aCellIdentifier
              configCellBlock:(CGTableViewConfigCellBlock)anBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
@end
