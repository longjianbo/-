//
//  DuanZiDetailModel.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuanZiDetailModel.h"

@implementation DuanZiDetailModel

@end
@implementation DuanZiDetailData

+ (NSDictionary *)objectClassInArray{
    return @{@"top_comments" : [DuanZiDetailTop_Comments class], @"recent_comments" : [DuanZiDetailRecent_Comments class]};
}

@end


@implementation DuanZiDetailTop_Comments

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


@implementation DuanZiDetailRecent_Comments

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end


