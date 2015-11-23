//
//  DuanZiDetailViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuanZiDetailViewModel.h"
#import "DuanZiDetailNetManager.h"
#import "DuanZiDetailModel.h"
@implementation DuanZiDetailViewModel
-(instancetype)initWithGroupID:(long)groupId{
    if (self = [super init]) {
        _group_id = groupId;
    }
    return self;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuanZiDetailNetManager getDuanZiDetailWith:_group_id completionHandle:^(DuanZiDetailModel * model, NSError *error) {
        
        self.recentComments = model.data.recent_comments;
        _recentArrCount = self.recentComments.count;
        self.topComments = model.data.top_comments;
        _topCouts = self.topComments.count;
        completionHandle(error);
    }];
}


-(NSInteger)recentArrCount{
    return self.recentComments.count;
}
-(DuanZiDetailRecent_Comments  *)recommetModelForRow:(NSInteger)row {
    return self.recentComments[row];
}
/** 热门*/
-(NSInteger)topCouts{
    return self.topComments.count;
}
-(DuanZiDetailTop_Comments *)topCommentModelForRow:(NSInteger)row{
    return self.topComments[row];
}
/** 热门评论人头像 */
-(NSURL *)topIconInRecentForRow:(NSInteger)row{
    return [NSURL URLWithString:[self recommetModelForRow:row].avatar_url];

}
/** 热门评论人ID */
-(NSString *)topNameInRecentForRow:(NSInteger)row{
    return [self recommetModelForRow:row].user_name;
}
/** 热门评论时间 */
-(NSString *)topTimeInRecentForRow:(NSInteger)row{
    //获取当前秒数
    NSTimeInterval currentTime = [[NSDate date]timeIntervalSince1970];
    //算出当前时间和创建时间的间隔秒数
    NSTimeInterval delta = currentTime - [self recommetModelForRow:row].create_time/1000;
    //秒数转小时
    NSInteger hours = delta / 3600;
    if (hours < 24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }
    //秒数转天数
    NSInteger days = delta /3600000 / 24;
    return [NSString stringWithFormat:@"%ld天前",days];
    
    
    
}
/** 热门点赞数量 */
-(NSString *)topdiggCountInRecentForRow:(NSInteger)row{
    
    return [NSString stringWithFormat:@"%ld",[self recommetModelForRow:row].digg_count];
}
/** 热门评论内容 */
-(NSString *)topTextInRecentForRow:(NSInteger)row{
    return [self recommetModelForRow:row].text;
}

/** 评论人头像 */
-(NSURL *)iconForRow:(NSInteger)row{
    return [NSURL URLWithString:[self topCommentModelForRow:row].avatar_url];
}
/** 评论人ID */
-(NSString *)nameForRow:(NSInteger)row{
    return [self topCommentModelForRow:row].user_name;
}
/** 评论时间 */
-(NSString *)timeForRow:(NSInteger)row{
    //获取当前秒数
    NSTimeInterval currentTime = [[NSDate date]timeIntervalSince1970];
    //算出当前时间和创建时间的间隔
    NSTimeInterval delta = currentTime - [self topCommentModelForRow:row].create_time;
    //秒数转小时
    NSInteger hours = delta / 3600;
    if (hours < 24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }
    //秒数转天数
    NSInteger days = delta  / 3600 / 24;
    return [NSString stringWithFormat:@"%ld天前",days];
}
/** 点赞数量 */
-(NSString *)diggCountForRow:(NSInteger)row{
    
    
    return [NSString stringWithFormat:@"%ld",[self topCommentModelForRow:row].digg_count];
}
/** 评论内容 */
-(NSString *)textForRow:(NSInteger)row{
    return [self topCommentModelForRow:row].text;
}
@end
