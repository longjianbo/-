//
//  DuanZiDetailCell.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface DuanZiDetailCell : UITableViewCell
/** 热门评论人头像 */
@property(nonatomic,strong)TRImageView *topUserImage;
/** 热门评论人ID */
@property(nonatomic,strong)UILabel *topUserID;
/** 热门评论时间 */
@property(nonatomic,strong)UILabel *topTime;
/** 热门点赞数量 */
@property(nonatomic,strong)UILabel *topDiggCount;
/** 热门评论内容 */
@property(nonatomic,strong)UILabel *topText;

///** 评论人头像 */
//@property(nonatomic,strong)TRImageView *userImage;
///** 评论人ID */
//@property(nonatomic,strong)UILabel *userID;
///** 评论时间 */
//@property(nonatomic,strong)UILabel *time;
///** 点赞数量 */
//@property(nonatomic,strong)UILabel *diggCount;
///** 评论内容 */
//@property(nonatomic,strong)UILabel *text;


@end
