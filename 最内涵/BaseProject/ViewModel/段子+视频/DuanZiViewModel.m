//
//  DuanZiViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuanZiViewModel.h"
#import "DuanZiNetManager.h"
#import "DuanZiModel.h"
@implementation DuanZiViewModel
{
    DuanZiModel *_model;
    NSTimeInterval _currentTime;
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
   _currentTime = [[NSDate date]timeIntervalSince1970];
    
    _min_time = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _min_time += 10 ;
    if (_min_time == _max_time ) {
        NSError *error =[NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多的数据了"}];
        completionHandle(error);
    }
    
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuanZiNetManager getDuanZiWithTime:self.min_time completionHandle:^(DuanZiModel *model, NSError *error) {
        
        if (_min_time ==_currentTime) {
            [self.dataArr removeAllObjects];
        }
        
        
        
        [self.dataArr addObjectsFromArray:model.data.data];
        _max_time = model.data.max_time;

        completionHandle(error);
    }];
}

-(long)groupIdForRow:(NSInteger)row{
    return [self modelForRow:row].group.group_id;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(DuanZiDataList *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
/** 作者头像 */
-(NSURL *)userIconForRow:(NSInteger)row{
    NSString *path =[self modelForRow:row].group.user.avatar_url;

    return [NSURL URLWithString:path];
}
/** 作者ID */
-(NSString *)nameForRow:(NSInteger)row{
    return [self modelForRow:row].group.user.name;
}
/** 段子目录 */
-(NSString *)contentForRow:(NSInteger)row{
    return [self modelForRow:row].group.content;
}
/** 段子分类 */
-(NSString *)categoryNameForRow:(NSInteger)row{
    return [self modelForRow:row].group.category_name;
}
/** 视频 赞 */
-(NSString *)diggCountForRow:(NSInteger)row{
    if ([self modelForRow:row].group.digg_count > 10000) {
        return [NSString stringWithFormat:@"%.1f万",[self modelForRow:row].group.digg_count/10000.0];
    }
    return [NSString stringWithFormat:@"%ld",[self modelForRow:row].group.digg_count];
}
/** 视频 踩 */
-(NSString *)buryCountForRow:(NSInteger)row{
    if ([self modelForRow:row].group.bury_count > 10000) {
        return [NSString stringWithFormat:@"%.1f万",[self modelForRow:row].group.bury_count/10000.0];
    }
    return [NSString stringWithFormat:@"%ld",[self modelForRow:row].group.bury_count];
}
/** 视频 评论 */
-(NSString *)commentCountForRow:(NSInteger)row{
    if ([self modelForRow:row].group.comment_count > 10000) {
        return [NSString stringWithFormat:@"%.1f万",[self modelForRow:row].group.comment_count /10000.0];
    }
    return [NSString stringWithFormat:@"%ld",[self modelForRow:row].group.comment_count];
}
/** 视频 分享 */
-(NSString *)shareCountForRow:(NSInteger)row{
    if ([self modelForRow:row].group.share_count > 10000) {
        return [NSString stringWithFormat:@"%.1f万",[self modelForRow:row].group.share_count /10000.0];
    }
    return [NSString stringWithFormat:@"%ld",[self modelForRow:row].group.share_count];
}
@end
