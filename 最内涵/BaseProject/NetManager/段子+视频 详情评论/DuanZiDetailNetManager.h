//
//  ShiPinDetailNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "DuanZiDetailModel.h"
@interface DuanZiDetailNetManager : BaseNetManager

+(id)getDuanZiDetailWith:(long)group_id kCompletionHandle;
@end
