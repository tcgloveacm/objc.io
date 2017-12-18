//
//  CGUser.m
//  1_轻量级 ViewController
//
//  Created by  NorthCity on 2017/12/18.
//  Copyright © 2017年  NorthCity. All rights reserved.
//

#import "User.h"

static NSString * const kIndentifier = @"identifier";
static NSString * const kUserName = @"username";
static NSString * const kFirstName = @"firstname";
static NSString * const kLastName = @"lastname";
static NSString * const kPhotos = @"photos";

@implementation User

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeInt64:self.identifier forKey:kIndentifier];
    [coder encodeObject:self.userName forKey:kUserName];
    [coder encodeObject:self.firstName forKey:kFirstName];
    [coder encodeObject:self.lastName forKey:kLastName];
    [coder encodeObject:self.photos forKey:kPhotos];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        self.identifier = [coder decodeInt64ForKey:kIndentifier];
        self.userName = [coder decodeObjectForKey:kUserName];
        self.firstName = [coder decodeObjectForKey:kFirstName];
        self.lastName = [coder decodeObjectForKey:kLastName];
        self.photos = [coder decodeObjectForKey:kPhotos];
    }
    return self;
}

- (BOOL)requiresSecureCoding
{
    return YES;
}


- (NSString *)description {
    NSString *formatString = @"<%@: %p> (%lld) \'%@\'";
    return [NSString stringWithFormat:formatString, [self class], self,
            (long long) self.identifier, self.userName];
}


- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@",self.firstName,self.lastName];
}

- (NSInteger)numberOfPhotos {
    return self.photos.count;
}

@end
