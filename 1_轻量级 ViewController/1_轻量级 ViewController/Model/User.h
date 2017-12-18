//
//  CGUser.h
//  1_轻量级 ViewController
//
//  Created by  NorthCity on 2017/12/18.
//  Copyright © 2017年  NorthCity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>
@property(nonatomic, assign) int64_t identifier;
@property(nonatomic, copy) NSString *userName;
@property(nonatomic, copy) NSString *firstName;
@property(nonatomic, copy) NSString *lastName;
@property(nonatomic, copy) NSArray *photos;

- (NSString *)fullName;
- (NSInteger)numberOfPhotos;
@end
