//
//  CGPhotoCell+ConfigForPhoto.m
//  1_轻量级 ViewController
//
//  Created by  NorthCity on 2017/12/18.
//  Copyright © 2017年  NorthCity. All rights reserved.
//

#import "CGPhotoCell+ConfigForPhoto.h"
#import "Photo.h"

@implementation CGPhotoCell (ConfigForPhoto)
- (void)configCell:(Photo *)photo {
    self.titleLable.text = photo.name;
    self.timeLabel.text = [self.dateFormater stringFromDate:photo.creationDate];
}

- (NSDateFormatter *)dateFormater {
    static NSDateFormatter *dateFormater;
    if (!dateFormater) {
        dateFormater = [[NSDateFormatter alloc] init];
        dateFormater.timeStyle = NSDateFormatterMediumStyle;
        dateFormater.dateStyle = NSDateFormatterMediumStyle;
    }
    return dateFormater;
}

@end
