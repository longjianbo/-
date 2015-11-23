//
//  DuanZiDetailModel.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class DuanZiDetailData,DuanZiDetailTop_Comments,DuanZiDetailRecent_Comments;
@interface DuanZiDetailModel : BaseModel

@property (nonatomic, assign) BOOL has_more;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) long long group_id;

@property (nonatomic, strong) DuanZiDetailData *data;

@property (nonatomic, assign) BOOL new_comment;

@property (nonatomic, assign) NSInteger total_number;

@end
@interface DuanZiDetailData : NSObject

@property (nonatomic, strong) NSArray<DuanZiDetailTop_Comments *> *top_comments;

@property (nonatomic, strong) NSArray<DuanZiDetailRecent_Comments *> *recent_comments;

@end

@interface DuanZiDetailTop_Comments : NSObject

@property (nonatomic, copy) NSString *user_name;

@property (nonatomic, copy) NSString *user_profile_url;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger is_digg;

@property (nonatomic, assign) long long group_id;

@property (nonatomic, assign) NSInteger user_bury;

@property (nonatomic, assign) long long user_id;

@property (nonatomic, assign) NSInteger create_time;

@property (nonatomic, assign) NSInteger digg_count;

@property (nonatomic, assign) BOOL user_verified;

@property (nonatomic, assign) NSInteger bury_count;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, copy) NSString *platform_id;

@property (nonatomic, assign) long long ID;

@property (nonatomic, assign) long long comment_id;

@property (nonatomic, copy) NSString *platform;

@property (nonatomic, assign) NSInteger user_digg;

@property (nonatomic, copy) NSString *user_profile_image_url;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *description;

@end

@interface DuanZiDetailRecent_Comments : NSObject

@property (nonatomic, copy) NSString *user_name;

@property (nonatomic, copy) NSString *user_profile_url;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger is_digg;

@property (nonatomic, assign) long long group_id;

@property (nonatomic, assign) NSInteger user_bury;

@property (nonatomic, assign) long long user_id;

@property (nonatomic, assign) NSInteger create_time;

@property (nonatomic, assign) NSInteger digg_count;

@property (nonatomic, assign) BOOL user_verified;

@property (nonatomic, assign) NSInteger bury_count;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, copy) NSString *platform_id;

@property (nonatomic, assign) long long ID;

@property (nonatomic, assign) long long comment_id;

@property (nonatomic, copy) NSString *platform;

@property (nonatomic, assign) NSInteger user_digg;

@property (nonatomic, copy) NSString *user_profile_image_url;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *description;

@end

