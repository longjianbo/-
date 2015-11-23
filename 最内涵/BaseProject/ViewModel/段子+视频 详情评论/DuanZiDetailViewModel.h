//
//  DuanZiDetailViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuanZiDetailNetManager.h"
@interface DuanZiDetailViewModel : BaseViewModel

@property(nonatomic)long group_id;

@property(nonatomic)NSInteger create_time;

@property(nonatomic,strong)NSArray *recentComments;
@property(nonatomic)NSInteger recentArrCount;
@property(nonatomic)NSInteger topCouts;
@property(nonatomic,strong)NSArray *topComments;
-(instancetype)initWithGroupID:(long)groupId;



/** 热门评论人头像 */
-(NSURL *)topIconInRecentForRow:(NSInteger)row;
/** 热门评论人ID */
-(NSString *)topNameInRecentForRow:(NSInteger)row;
/** 热门评论时间 */
-(NSString *)topTimeInRecentForRow:(NSInteger)row;
/** 热门点赞数量 */
-(NSString *)topdiggCountInRecentForRow:(NSInteger)row;
/** 热门评论内容 */
-(NSString *)topTextInRecentForRow:(NSInteger)row;

/** 评论人头像 */
-(NSURL *)iconForRow:(NSInteger)row;
/** 评论人ID */
-(NSString *)nameForRow:(NSInteger)row;
/** 评论时间 */
-(NSString *)timeForRow:(NSInteger)row;
/** 点赞数量 */
-(NSString *)diggCountForRow:(NSInteger)row;
/** 评论内容 */
-(NSString *)textForRow:(NSInteger)row;
@end
