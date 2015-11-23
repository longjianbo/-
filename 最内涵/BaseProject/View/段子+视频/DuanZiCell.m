//
//  DuanZiCell.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuanZiCell.h"
#import "DuanZiNetManager.h"
#import "DuanZiViewModel.h"
#import "DuanZiViewController.h"


@implementation DuanZiCell



- (TRImageView *)image {
    if(_image == nil) {
        _image = [[TRImageView alloc] init];
        [self.contentView addSubview:_image];
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(-5);
            make.left.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(25, 16));
        }];
    }
    return _image;
}


- (TRImageView *)userIcon {
    if(_userIcon == nil) {
        _userIcon = [[TRImageView alloc] init];
        _userIcon.layer.cornerRadius = 25/2;
        [self.contentView addSubview:_userIcon];
        [_userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
    }
    return _userIcon;
}

- (UILabel *)userID {
    if(_userID == nil) {
        _userID = [[UILabel alloc] init];
        _userID.font = [UIFont systemFontOfSize:16];
        _userID.textColor = [UIColor grayColor];
        [self.contentView addSubview:_userID];
        [_userID mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userIcon.mas_right).mas_equalTo(8);
            make.centerY.mas_equalTo(self.userIcon.mas_centerY);
            make.right.mas_equalTo(-40);
        }];
    }
    return _userID;
}

- (UILabel *)content {
    if(_content == nil) {
        _content = [[UILabel alloc] init];
        _content.font = [UIFont systemFontOfSize:18];
        _content.numberOfLines = 0;
        [self.contentView addSubview:_content];
        [_content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.userIcon.mas_leftMargin);
            make.top.mas_equalTo(self.userIcon.mas_bottom).mas_equalTo(20);
            make.right.mas_equalTo(-20);
        }];
    }
    return _content;
}

- (FUIButton *)categoryName {
    if(_categoryName == nil) {
        _categoryName = [FUIButton buttonWithType:0];
        _categoryName.shadowHeight = 2.0;
        _categoryName.buttonColor = [UIColor cloudsColor];
        _categoryName.shadowColor = kRGBColor(225, 227, 231);
        _categoryName.cornerRadius = 6.0f;
        _categoryName.titleLabel.font = [UIFont boldFlatFontOfSize:15];
        [_categoryName setTitleColor:[UIColor greenSeaColor] forState:UIControlStateNormal];
        [_categoryName setTitleColor:[UIColor greenSeaColor] forState:UIControlStateHighlighted];
        
        [self.contentView addSubview:_categoryName];
        [_categoryName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.content.mas_leftMargin);
            make.top.mas_equalTo(self.content.mas_bottom).mas_equalTo(20);
        }];
        
    }
    return _categoryName;
}

- (UILabel *)diggCount {
    if(_diggCount == nil) {
        _diggCount = [[UILabel alloc] init];
        _diggCount.font = [UIFont systemFontOfSize:12];
        _diggCount.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_diggCount];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"digupicon_textpage"]];
        imageView.layer.cornerRadius = 36/2;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(36, 36));
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.categoryName.mas_bottom).mas_equalTo(30);
            make.bottom.mas_equalTo(-10);
            
        }];
        [_diggCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(0);
            make.centerY.mas_equalTo(imageView);
        }];
    }
    return _diggCount;
}

- (UILabel *)buryCount {
    if(_buryCount == nil) {
        _buryCount = [[UILabel alloc] init];
        _buryCount.font = [UIFont systemFontOfSize:12];
        _buryCount.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_buryCount];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"digdownicon_textpage"]];
        imageView.layer.cornerRadius = 36/2;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(36, 36));
            make.centerY.mas_equalTo(self.diggCount);
            make.left.mas_equalTo(self.diggCount.mas_right).mas_equalTo(kContentImage);
        }];
        [_buryCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(0);
            make.centerY.mas_equalTo(self.diggCount);
        }];

    }
    return _buryCount;
}

- (UILabel *)commentCount {
    if(_commentCount == nil) {
        _commentCount = [[UILabel alloc] init];
        _commentCount.font = [UIFont systemFontOfSize:12];
        _commentCount.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_commentCount];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"commenticon_textpage"]];
        imageView.layer.cornerRadius = 36/2;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(36, 36));
            make.centerY.mas_equalTo(self.diggCount);
            make.left.mas_equalTo(self.buryCount.mas_right).mas_equalTo(kContentImage);
        }];
        [_commentCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(0);
            make.centerY.mas_equalTo(self.buryCount);
        }];
    }
    return _commentCount;
}

- (UILabel *)shareCount {
    if(_shareCount == nil) {
        _shareCount = [[UILabel alloc] init];
        _shareCount.font = [UIFont systemFontOfSize:12];
        _shareCount.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_shareCount];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"moreicon_textpage"]];
        imageView.layer.cornerRadius = 36/2;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(36, 36));
            make.centerY.mas_equalTo(self.diggCount);
            make.left.mas_equalTo(self.commentCount.mas_right).mas_equalTo(kContentImage);
        }];
        [_shareCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(0);
            make.centerY.mas_equalTo(self.diggCount);
        }];
    }
    return _shareCount;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
