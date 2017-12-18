//
//  CGStore.m
//  1_轻量级 ViewController
//
//  Created by  NorthCity on 2017/12/18.
//  Copyright © 2017年  NorthCity. All rights reserved.
//

#import "CGStore.h"
#import "Photo.h"

@implementation CGStore
static CGStore *instance = nil;

+ (instancetype)store {
    static  dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        [self readArchive];
    }
    return self;
}

- (NSString *)description {
    NSString *formaterString = @"<%@:%p>/(%@)/%@";
    return [NSString stringWithFormat:formaterString,[self class],self,(long long)self.photos,self.users];
}

- (void)readArchive {
    NSURL *archiveURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"photodata" withExtension:@"bin"];
    NSAssert(archiveURL != nil, @"Unable to find archive in bundle.");
    NSData *data = [NSData dataWithContentsOfURL:archiveURL options:0 error:NULL];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    _users = [unarchiver decodeObjectOfClass:[NSArray class] forKey:@"users"];
    _photos = [unarchiver decodeObjectOfClass:[NSArray class] forKey:@"photos"];
    [unarchiver finishDecoding];
}

- (NSArray *)sortedPhotos {
    return [self.photos sortedArrayUsingComparator:^NSComparisonResult(Photo *  _Nonnull obj1, Photo *  _Nonnull obj2) {
       return [obj1.creationDate compare:obj2.creationDate];
    }];
}

@end
