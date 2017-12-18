//
//  CGPhoto.m
//  1_轻量级 ViewController
//
//  Created by  NorthCity on 2017/12/18.
//  Copyright © 2017年  NorthCity. All rights reserved.
//

#import "Photo.h"
#import "User.h"

static NSString * const kIdentifier = @"identifier";
static NSString * const kName = @"name";
static NSString * const kDate = @"creationDate";
static NSString * const kRating = @"rating";
static NSString * const kUser = @"user";
@implementation Photo

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self) {
        self.identifier = [coder decodeInt64ForKey:kIdentifier];
        self.name = [coder decodeObjectForKey:kName];
        self.creationDate = [coder decodeObjectForKey:kDate];
        self.rating = [coder decodeDoubleForKey:kRating];
        self.user = [coder decodeObjectForKey:kUser];
    }
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeInt64:self.identifier forKey:kIdentifier];
    [aCoder encodeObject:self.name forKey:kName];
    [aCoder encodeObject:self.creationDate forKey:kDate];
    [aCoder encodeDouble:self.rating forKey:kRating];
    [aCoder encodeObject:self.user forKey:kUser];
}

- (NSString *)description {
    NSString *formaterString = @"<%@: %p> (%lld) \'%@\'";
    return [NSString stringWithFormat:formaterString,[self class],self,(long long)self.identifier,self.name];
}


- (NSString*)authorFullName {
    return self.user.fullName;
}

- (double)adjustedRating {
    double adjustedRating = (self.rating - 97) / 3.0;
    if (adjustedRating < 0) {
        adjustedRating = 0;
    }
    return adjustedRating;
}
@end
