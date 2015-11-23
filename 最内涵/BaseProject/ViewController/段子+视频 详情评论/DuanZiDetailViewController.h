//
//  DuanZiDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DuanZiViewModel.h"
@interface DuanZiDetailViewController : UIViewController

@property(nonatomic,strong)UIViewController *duanziDetailVC;
/** 用户头像 */
@property(nonatomic,strong)NSURL *userIcon;
/** 用户名 */
@property(nonatomic,strong)NSString *userID;
/** 段子内容 */
@property(nonatomic,strong)NSString *content;
/** 段子分类 */
@property(nonatomic,strong)NSString *categoryName;
/** 赞 */
@property(nonatomic,strong)NSString *diggCount;
/** 踩 */
@property(nonatomic,strong)NSString *buryCount;
/** 评论 */
@property(nonatomic,strong)NSString *commentCount;
/** 分享 */
@property(nonatomic,strong)NSString *shareCount;


-(instancetype)initWithGroup:(long)groupId;
@property(nonatomic)long groupId;

@end
