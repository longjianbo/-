//
//  ShiPinDetailNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ShiPinDetailModel.h"
@interface ShiPinDetailNetManager : BaseNetManager

+ (id)getShiPinDetailWith:(long)group_id kCompletionHandle;
@end
