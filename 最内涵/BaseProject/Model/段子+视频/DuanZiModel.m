//
//  DuanZiModel.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuanZiModel.h"

@implementation DuanZiModel

@end
@implementation DuanZiData

+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [DuanZiDataList class]};
}

@end


@implementation DuanZiDataList

@end


@implementation DuanZiGroupList

+ (NSDictionary *)objectClassInArray{
    return @{@"dislike_reason" : [DuanZiDislike_ReasonList class]};
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


@implementation DuanZiActivityList

@end


@implementation DuanZiUserList

@end


@implementation DuanZiNeihan_Hot_LinkList

@end


@implementation DuanZiDislike_ReasonList
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


