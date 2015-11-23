//
//  DuanZiViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface DuanZiViewModel : BaseViewModel
@property(nonatomic)NSInteger min_time;
@property(nonatomic)NSInteger rowNumber;
@property(nonatomic)NSInteger max_time;
/** 作者头像 */
-(NSURL *)userIconForRow:(NSInteger)row;
/** 作者ID */
-(NSString *)nameForRow:(NSInteger)row;
/** 段子目录 */
-(NSString *)contentForRow:(NSInteger)row;
/** 段子分类 */
-(NSString *)categoryNameForRow:(NSInteger)row;
/** 段子 赞 */
-(NSString *)diggCountForRow:(NSInteger)row;
/** 段子 踩 */
-(NSString *)buryCountForRow:(NSInteger)row;
/** 段子 评论 */
-(NSString *)commentCountForRow:(NSInteger)row;
/** 段子 分享 */
-(NSString *)shareCountForRow:(NSInteger)row;
//数组data
@property(nonatomic,strong)NSArray *groupData;

-(long)groupIdForRow:(NSInteger)row;

@end
