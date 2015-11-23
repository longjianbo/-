//
//  DuanZiModel.h
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class DuanZiData,DuanZiDataList,DuanZiGroupList,DuanZiActivityList,DuanZiUserList,DuanZiNeihan_Hot_LinkList,DuanZiDislike_ReasonList;
@interface DuanZiModel : BaseModel

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) DuanZiData *data;

@end
@interface DuanZiData : NSObject

@property (nonatomic, assign) BOOL has_more;

@property (nonatomic, assign) NSInteger min_time;

@property (nonatomic, strong) NSArray<DuanZiDataList *> *data;

@property (nonatomic, assign) NSInteger max_time;

@property (nonatomic, copy) NSString *tip;

@end

@interface DuanZiDataList : NSObject

@property (nonatomic, strong) DuanZiGroupList *group;

@property (nonatomic, assign) NSInteger online_time;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) NSArray *comments;

@property (nonatomic, assign) NSInteger display_time;

@end

@interface DuanZiGroupList : NSObject

@property (nonatomic, assign) BOOL allow_dislike;

@property (nonatomic, assign) NSInteger share_type;

@property (nonatomic, assign) long long ID;

@property (nonatomic, assign) NSInteger user_bury;

@property (nonatomic, assign) BOOL quick_comment;

@property (nonatomic, copy) NSString *neihan_hot_end_time;

@property (nonatomic, assign) NSInteger bury_count;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *neihan_hot_start_time;

@property (nonatomic, assign) NSInteger label;

@property (nonatomic, assign) NSInteger share_count;

@property (nonatomic, assign) BOOL category_visible;

@property (nonatomic, assign) NSInteger has_comments;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) BOOL is_neihan_hot;

@property (nonatomic, assign) NSInteger user_favorite;

@property (nonatomic, assign) NSInteger user_digg;

@property (nonatomic, strong) DuanZiUserList *user;

@property (nonatomic, assign) NSInteger create_time;

@property (nonatomic, assign) NSInteger category_type;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, strong) NSArray<DuanZiDislike_ReasonList *> *dislike_reason;

@property (nonatomic, assign) NSInteger favorite_count;

@property (nonatomic, assign) NSInteger is_can_share;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, copy) NSString *status_desc;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger digg_count;

@property (nonatomic, strong) DuanZiNeihan_Hot_LinkList *neihan_hot_link;

@property (nonatomic, strong) DuanZiActivityList *activity;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) NSInteger user_repin;

@property (nonatomic, assign) BOOL is_anonymous;

@property (nonatomic, assign) long long group_id;

@property (nonatomic, assign) NSInteger go_detail_count;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, assign) NSInteger category_id;

@property (nonatomic, assign) NSInteger media_type;

@property (nonatomic, assign) NSInteger online_time;

@property (nonatomic, assign) NSInteger repin_count;

@property (nonatomic, assign) NSInteger has_hot_comments;

@end

@interface DuanZiActivityList : NSObject

@end

@interface DuanZiUserList : NSObject

@property (nonatomic, assign) BOOL user_verified;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, assign) long long user_id;

@property (nonatomic, assign) BOOL is_following;

@property (nonatomic, copy) NSString *name;

@end

@interface DuanZiNeihan_Hot_LinkList : NSObject

@end

@interface DuanZiDislike_ReasonList : NSObject

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@end

