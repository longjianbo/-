//
//  DuanZiDetailCell.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuanZiDetailCell.h"

@implementation DuanZiDetailCell

- (TRImageView *)topUserImage {
    if(_topUserImage == nil) {
        _topUserImage = [[TRImageView alloc] init];
        _topUserImage.layer.cornerRadius = 25/2;
        [self.contentView addSubview:_topUserImage];
        [_topUserImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(25);
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
    }
    return _topUserImage;
}

- (UILabel *)topUserID {
    if(_topUserID == nil) {
        _topUserID = [[UILabel alloc] init];
        _topUserID.font = [UIFont systemFontOfSize:16];
        _topUserID.textColor = [UIColor grayColor];
        [self.contentView addSubview:_topUserID];
        [_topUserID mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.topUserImage.mas_topMargin).mas_equalTo(-5);
            make.left.mas_equalTo(self.topUserImage.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-60);
        }];
    }
    return _topUserID;
}

- (UILabel *)topTime {
    if(_topTime == nil) {
        _topTime = [[UILabel alloc]init];
        _topTime.font = [UIFont systemFontOfSize:12];
        _topTime.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_topTime];
        [_topTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(self.topUserImage.mas_bottomMargin).mas_equalTo(5);
            make.left.mas_equalTo(self.topUserImage.mas_right).mas_equalTo(10);
        }];
    }
    return _topTime;
}

- (UILabel *)topDiggCount {
    if(_topDiggCount == nil) {
        _topDiggCount = [[UILabel alloc] init];
        _topDiggCount.font = [UIFont systemFontOfSize:12];
        _topDiggCount.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_topDiggCount];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"digupicon_textpage"]];
        imageView.layer.cornerRadius = 36/2;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(36, 36));
            make.right.mas_equalTo(-40);
            make.centerY.mas_equalTo(self.topUserImage);
        }];

        [_topDiggCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.right.mas_equalTo(-10);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(0);
        }];
    }
    return _topDiggCount;
}

- (UILabel *)topText {
    if(_topText == nil) {
        _topText = [[UILabel alloc] init];
        _topText.font = [UIFont systemFontOfSize:18];
        _topText.numberOfLines = 0;
        [self.contentView addSubview:_topText];
        [_topText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.topTime.mas_bottom).mas_equalTo(20);
            make.bottom.mas_equalTo(-20);
            make.leftMargin.mas_equalTo(self.topUserID);
            make.right.mas_equalTo(-10);
        }];
    }
    return _topText;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *view = [UIView new];
        view.backgroundColor = kRGBColor(217, 220, 224);
        self.selectedBackgroundView = view;
        
        UIView *view1 = [UIView new];
        view1.backgroundColor = kRGBColor(225, 227, 231);
        self.backgroundView = view1;
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
