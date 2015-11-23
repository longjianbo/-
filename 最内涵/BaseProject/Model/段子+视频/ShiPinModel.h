//
//  ShiPinModel.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class ShiPinData,ShiPinDataList,ShiPinGroupList,ShiPinLarge_CoverList,largeUrl_ListList,ShiPin480P_VideoList,video480Url_ListList,ShiPinOrigin_VideoList,originUrl_ListList,ShiPinNeihan_Hot_LinkList,ShiPinActivityList,ShiPin720P_VideoList,video720Url_ListList,ShiPin360P_VideoList,video360Url_ListList,ShiPinMedium_CoverList,mediumUrl_ListList,ShiPinUserList,ShiPinDislike_ReasonList;
@interface ShiPinModel : BaseModel

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) ShiPinData *data;

@end
@interface ShiPinData : NSObject

@property (nonatomic, assign) BOOL has_more;

@property (nonatomic, assign) NSInteger min_time;

@property (nonatomic, strong) NSArray<ShiPinDataList *> *data;

@property (nonatomic, assign) NSInteger max_time;

@property (nonatomic, copy) NSString *tip;

@end

@interface ShiPinDataList : NSObject

@property (nonatomic, strong) ShiPinGroupList *group;

@property (nonatomic, assign) NSInteger online_time;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) NSArray *comments;

@property (nonatomic, assign) NSInteger display_time;

@end

@interface ShiPinGroupList : NSObject

@property (nonatomic, assign) NSInteger user_favorite;

@property (nonatomic, strong) ShiPinUserList *user;

@property (nonatomic, copy) NSString *publish_time;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) long long ID;

@property (nonatomic, strong) ShiPinOrigin_VideoList *origin_video;

@property (nonatomic, assign) NSInteger play_count;

@property (nonatomic, assign) long long group_id;

@property (nonatomic, assign) BOOL category_visible;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *flash_url;

@property (nonatomic, strong) ShiPinNeihan_Hot_LinkList *neihan_hot_link;

@property (nonatomic, assign) NSInteger user_repin;

@property (nonatomic, copy) NSString *cover_image_uri;

@property (nonatomic, copy) NSString *status_desc;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray<ShiPinDislike_ReasonList *> *dislike_reason;

@property (nonatomic, assign) NSInteger repin_count;

@property (nonatomic, copy) NSString *cover_image_url;

@property (nonatomic, assign) NSInteger digg_count;

@property (nonatomic, assign) NSInteger share_count;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger video_width;

@property (nonatomic, copy) NSString *neihan_hot_start_time;

@property (nonatomic, assign) NSInteger is_video;

@property (nonatomic, assign) NSInteger has_hot_comments;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, assign) NSInteger go_detail_count;

@property (nonatomic, assign) NSInteger favorite_count;

@property (nonatomic, strong) ShiPinLarge_CoverList *large_cover;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, assign) NSInteger online_time;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, assign) NSInteger create_time;

@property (nonatomic, assign) NSInteger user_digg;

@property (nonatomic, assign) NSInteger category_id;

@property (nonatomic, assign) NSInteger category_type;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, assign) BOOL is_anonymous;

@property (nonatomic, assign) BOOL quick_comment;

@property (nonatomic, assign) NSInteger bury_count;

@property (nonatomic, assign) NSInteger media_type;

@property (nonatomic, assign) NSInteger user_bury;

@property (nonatomic, strong) ShiPinMedium_CoverList *medium_cover;

@property (nonatomic, assign) NSInteger share_type;

@property (nonatomic, assign) NSInteger duration;

@property (nonatomic, strong) ShiPin480P_VideoList *V480p_video;

@property (nonatomic, assign) NSInteger video_height;

@property (nonatomic, assign) NSInteger is_public_url;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *neihan_hot_end_time;

@property (nonatomic, assign) NSInteger is_can_share;

@property (nonatomic, assign) BOOL is_neihan_hot;

@property (nonatomic, copy) NSString *mp4_url;

@property (nonatomic, assign) NSInteger has_comments;

@property (nonatomic, copy) NSString *keywords;

@property (nonatomic, strong) ShiPin360P_VideoList *V360p_video;

@property (nonatomic, strong) ShiPin720P_VideoList *V720p_video;

@property (nonatomic, copy) NSString *m3u8_url;

@property (nonatomic, assign) NSInteger label;

@property (nonatomic, assign) BOOL allow_dislike;

@property (nonatomic, strong) ShiPinActivityList *activity;

@end

@interface ShiPinLarge_CoverList : NSObject

@property (nonatomic, strong) NSArray<largeUrl_ListList *> *url_list;

@property (nonatomic, copy) NSString *uri;

@end

@interface largeUrl_ListList : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface ShiPin480P_VideoList : NSObject

@property (nonatomic, strong) NSArray<video480Url_ListList *> *url_list;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger height;

@end

@interface video480Url_ListList : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface ShiPinOrigin_VideoList : NSObject

@property (nonatomic, strong) NSArray<originUrl_ListList *> *url_list;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger height;

@end

@interface originUrl_ListList : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface ShiPinNeihan_Hot_LinkList : NSObject

@end

@interface ShiPinActivityList : NSObject

@end

@interface ShiPin720P_VideoList : NSObject

@property (nonatomic, strong) NSArray<video720Url_ListList *> *url_list;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger height;

@end

@interface video720Url_ListList : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface ShiPin360P_VideoList : NSObject

@property (nonatomic, strong) NSArray<video360Url_ListList *> *url_list;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger height;

@end

@interface video360Url_ListList : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface ShiPinMedium_CoverList : NSObject

@property (nonatomic, strong) NSArray<mediumUrl_ListList *> *url_list;

@property (nonatomic, copy) NSString *uri;

@end

@interface mediumUrl_ListList : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface ShiPinUserList : NSObject

@property (nonatomic, assign) BOOL user_verified;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, assign) long long user_id;

@property (nonatomic, assign) BOOL is_following;

@property (nonatomic, copy) NSString *name;

@end

@interface ShiPinDislike_ReasonList : NSObject

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@end

