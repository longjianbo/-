//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "DuanZiViewController.h"
#import "ShiPinViewController.h"
#import "LeftViewController.h"
#import "TuWanViewController.h"
@interface AppDelegate ()
@property(nonatomic,strong)RESideMenu *sideMenu;
@property(nonatomic,strong)RESideMenu *sideMenu1;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    [self configGlobalUIStyle];
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.rootViewController = self.sideMenu;
    [self.window makeKeyAndVisible];
    UIApplicationShortcutItem *shortItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"段子+视频" localizedTitle:@"段子+视频"];
    UIApplicationShortcutItem *shortItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"游戏资讯" localizedTitle:@"游戏资讯"];
    NSArray *shortItems = [[NSArray alloc] initWithObjects:shortItem1, shortItem2, nil];
    [[UIApplication sharedApplication] setShortcutItems:shortItems];
    NSLog(@"%@", shortItems);
    return YES;
}
/** 配置全局UI的样式 */
- (void)configGlobalUIStyle{
    /** 导航栏不透明 */
    [[UINavigationBar appearance] setTranslucent:YES];
    /** 设置导航栏背景图 */
    //[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setBarTintColor:kRGBColor(209, 179, 131)];
    /** 配置导航栏题目的样式 */
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:kNaviTitleFontSize], NSForegroundColorAttributeName: kNaviTitleColor}];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}
/** 代码重构 */
-(UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

-(RESideMenu *)sideMenu{
    if (!_sideMenu) {
        _sideMenu = [[RESideMenu alloc]initWithContentViewController:[DuanZiViewController standardDuanZiNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        
        _sideMenu.backgroundImage = [UIImage imageNamed:@"side_bg_2"];
        
        _sideMenu.menuPrefersStatusBarHidden = YES;
        
        _sideMenu.bouncesHorizontally = NO;
        
        }
        
    
    return  _sideMenu;
}

-(RESideMenu *)sideMenu1{
    if (!_sideMenu1) {
        _sideMenu1 = [[RESideMenu alloc]initWithContentViewController:[TuWanViewController standardTuWanNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        
        _sideMenu1.backgroundImage = [UIImage imageNamed:@"side_bg_2"];
        
        _sideMenu1.menuPrefersStatusBarHidden = YES;
        
        _sideMenu1.bouncesHorizontally = NO;
        
    }
    
    
    return  _sideMenu1;
}
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    if ([shortcutItem.type  isEqual: @"游戏资讯"]) {

        //设置当前的VC为rootVC
        self.window.rootViewController = self.sideMenu1;
        
        return;

            }
    if ([shortcutItem.type  isEqual: @"游戏资讯"]) {
        self.window.rootViewController = self.sideMenu;
        
        return;
    }
    return;
}
@end
