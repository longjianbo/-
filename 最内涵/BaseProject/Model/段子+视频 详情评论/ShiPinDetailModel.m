//
//  ShiPinDetailModel.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiPinDetailModel.h"

@implementation ShiPinDetailModel

@end
@implementation ShiPinDetailData

+ (NSDictionary *)objectClassInArray{
    return @{@"top_comments" : [ShiPinDetailTop_Comments class], @"recent_comments" : [ShiPinDetailRecent_Comments class]};
}

@end


@implementation ShiPinDetailTop_Comments
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end


@implementation ShiPinDetailRecent_Comments
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end


