//
//  DuanZiNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "DuanZiModel.h"
@interface DuanZiNetManager : BaseNetManager

+(id)getDuanZiWithTime:(NSInteger)min_time kCompletionHandle;
@end
