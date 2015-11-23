//
//  ShiPinDetailNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuanZiDetailNetManager.h"

@implementation DuanZiDetailNetManager

+(id)getDuanZiDetailWith:(long)group_id completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = @"http://isub.snssdk.com/2/data/v2/get_essay_comments";
    NSDictionary *params = @{@"iid":@"3233355198",@"os_version":@"9.1",@"os_api":@"18",@"app_name":@"joke_essay",@"channel":@"App%20Store",@"device_platform":@"iphone",@"idfa":@"idfa",@"vid":@"5051F587-90B6-4A42-99A3-1FD4DA98D818",@"openudid":@"22c967adbb008bde2dfb59fc8686c5d7a958cf6e",@"device_type":@"iPhone8,1",@"version_code":@"4.4.2",@"ac":@"WIFI",@"screen_width":@"750",@"device_id":@"7801119774",@"aid":@"7",@"count":@"20",@"device_id":@"7801119774",@"group_id":@(group_id),@"offset":@"0",@"sort":@"hot",@"tag":@"joke"};
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuanZiDetailModel objectWithKeyValues:responseObj],error);
    }];
}
@end
