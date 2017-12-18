//
//  CGPhoto.h
//  1_轻量级 ViewController
//
//  Created by  NorthCity on 2017/12/18.
//  Copyright © 2017年  NorthCity. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface Photo : NSObject <NSCoding>
@property(nonatomic, assign) int64_t identifier;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, strong) NSDate *creationDate;
@property(nonatomic, assign) double rating;
@property(nonatomic, weak) User *user;

- (NSString*)authorFullName;
- (double)adjustedRating;
@end
