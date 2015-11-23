//
//  DuanZiCell.h
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface DuanZiCell : UITableViewCell
/** 用户头像 */
@property(nonatomic,strong)TRImageView *userIcon;
/** 用户名 */
@property(nonatomic,strong)UILabel *userID;
/** 段子内容 */
@property(nonatomic,strong)UILabel *content;
/** 段子分类 */
@property(nonatomic,strong)FUIButton *categoryName;
/** 赞 */
@property(nonatomic,strong)UILabel *diggCount;
/** 踩 */
@property(nonatomic,strong)UILabel *buryCount;
/** 评论 */
@property(nonatomic,strong)UILabel *commentCount;
/** 分享 */
@property(nonatomic,strong)UILabel *shareCount;
/** 热门图片 */
@property(nonatomic,strong)TRImageView *image;

@property(nonatomic,strong)UIView *leftView;

@property(nonatomic,strong)UIView *rightView;







@end
