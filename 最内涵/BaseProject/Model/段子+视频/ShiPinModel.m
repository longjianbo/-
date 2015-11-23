//
//  ShiPinModel.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiPinModel.h"

@implementation ShiPinModel

@end
@implementation ShiPinData

+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [ShiPinDataList class]};
}

@end


@implementation ShiPinDataList

@end


@implementation ShiPinGroupList

+ (NSDictionary *)objectClassInArray{
    return @{@"dislike_reason" : [ShiPinDislike_ReasonList class]};
}
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id",@"V480p_video":@"480p_video",@"V720p_video":@"720p_video",@"V360p_video":@"360p_video"};
}
@end


@implementation ShiPinLarge_CoverList

+ (NSDictionary *)objectClassInArray{
    return @{@"url_list" : [largeUrl_ListList class]};
}

@end


@implementation largeUrl_ListList

@end


@implementation ShiPin480P_VideoList

+ (NSDictionary *)objectClassInArray{
    return @{@"url_list" : [video480Url_ListList class]};
}

@end


@implementation video480Url_ListList

@end


@implementation ShiPinOrigin_VideoList

+ (NSDictionary *)objectClassInArray{
    return @{@"url_list" : [originUrl_ListList class]};
}

@end


@implementation originUrl_ListList

@end


@implementation ShiPinNeihan_Hot_LinkList

@end


@implementation ShiPinActivityList

@end


@implementation ShiPin720P_VideoList

+ (NSDictionary *)objectClassInArray{
    return @{@"url_list" : [video720Url_ListList class]};
}

@end


@implementation video720Url_ListList

@end


@implementation ShiPin360P_VideoList

+ (NSDictionary *)objectClassInArray{
    return @{@"url_list" : [video360Url_ListList class]};
}

@end


@implementation video360Url_ListList

@end


@implementation ShiPinMedium_CoverList

+ (NSDictionary *)objectClassInArray{
    return @{@"url_list" : [mediumUrl_ListList class]};
}

@end


@implementation mediumUrl_ListList

@end


@implementation ShiPinUserList

@end


@implementation ShiPinDislike_ReasonList
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


