//
//  ShiPinNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ShiPinModel.h"
@interface ShiPinNetManager : BaseNetManager

+(id)getShiPinWithTime:(NSInteger)min_time kCompletionHandle;
@end
