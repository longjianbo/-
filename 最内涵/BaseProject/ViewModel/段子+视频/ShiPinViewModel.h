//
//  ShiPinViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ShiPinNetManager.h"
@interface ShiPinViewModel : BaseViewModel
/** 行数 */
@property(nonatomic)NSInteger rowNumber;
@property(nonatomic)NSInteger min_time;
@property(nonatomic)NSInteger max_time;

/** 作者头像 */
-(NSURL *)userIconForRow:(NSInteger)row;
/** 作者ID */
-(NSString *)nameForRow:(NSInteger)row;
/** 视频目录 */
-(NSString *)contentForRow:(NSInteger)row;
/** 视频分类 */
-(NSString *)categoryNameForRow:(NSInteger)row;
/** 视频播放 */
-(NSURL *)videoURLForRow:(NSInteger)row;
/** 视频图片 */
-(NSURL *)videoIconURLForRow:(NSInteger)row;
/** 视频 赞 */
-(NSString *)diggCountForRow:(NSInteger)row;
/** 视频 踩 */
-(NSString *)buryCountForRow:(NSInteger)row;
/** 视频 评论 */
-(NSString *)commentCountForRow:(NSInteger)row;
/** 视频 分享 */
-(NSString *)shareCountForRow:(NSInteger)row;

@end
