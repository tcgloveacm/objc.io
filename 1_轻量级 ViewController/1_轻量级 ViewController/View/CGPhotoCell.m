//
//  CGPhotoCell.m
//  1_轻量级 ViewController
//
//  Created by  NorthCity on 2017/12/18.
//  Copyright © 2017年  NorthCity. All rights reserved.
//

#import "CGPhotoCell.h"


@implementation CGPhotoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    [self addSubview:self.titleLable];
    [self addSubview:self.timeLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLable.frame = CGRectMake(0, 0, self.frame.size.width, self.titleLable.frame.size.height);
    self.timeLabel.frame = CGRectMake(0, self.titleLable.frame.size.height, self.frame.size.width, self.timeLabel.frame.size.height);
}


#pragma mark - Getters
- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.text = @"=";
        [_titleLable sizeToFit];
    }
    return _titleLable;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"*";
        [_timeLabel sizeToFit];
    }
    return _timeLabel;
}

@end
