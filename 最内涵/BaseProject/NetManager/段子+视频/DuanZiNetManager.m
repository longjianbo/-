//
//  DuanZiNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuanZiNetManager.h"

@implementation DuanZiNetManager

+(id)getDuanZiWithTime:(NSInteger)min_time completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path =@"http://ic.snssdk.com/neihan/stream/mix/v1";
    NSDictionary *params=@{@"content_type":@"-102",@"os_api":@"18",@"app_name":@"joke_essay",@"channel":@"App%20Store",@"idfa":@"idfa",@"device_platform":@"iphone",@"vid":@"5051F587-90B6-4A42-99A3-1FD4DA98D818",@"openudid":@"22c967adbb008bde2dfb59fc8686c5d7a958cf6e",@"device_type":@"iPhone8,1",@"version_code":@"4.4.2",@"ac":@"3G",@"os_version":@"9.1",@"aid":@"7",@"screen_width":@"750",@"city":@"%E5%8C%97%E4%BA%AC%E5%B8%82",@"content_type":@"-102",@"count":@"30",@"essence":@"1",@"latitude":@"40.10089002586621",@"longitude":@"116.3581838864185",@"message_cursor":@"0",@"min_time":@(min_time),@"mpic":@"1"};
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle ([DuanZiModel objectWithKeyValues:responseObj],error);
    }];
}
@end
