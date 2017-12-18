//
//  CGStore.h
//  1_轻量级 ViewController
//
//  Created by  NorthCity on 2017/12/18.
//  Copyright © 2017年  NorthCity. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;
@class Photo;

@interface CGStore : NSObject
@property(nonatomic, strong, readonly) NSArray <User *>*users;
@property(nonatomic, strong, readonly) NSArray <Photo *>*photos;
+ (instancetype)store;

- (NSArray *)sortedPhotos;
@end
