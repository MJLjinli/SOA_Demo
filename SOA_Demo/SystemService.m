//
//  SystemService.m
//  SOA_Demo
//
//         我有一壶酒,足以慰风尘
//         倾倒江海里,共饮天下人
//
//  Created by 马金丽 on 17/8/1.
//  Copyright © 2017年 majinli. All rights reserved.
//


#import "SystemService.h"

@interface SystemService ()

@end

@implementation SystemService

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    UIApplicationShortcutIcon *collectionShortIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove];
    UIApplicationShortcutItem *collectionShortItem = [[UIApplicationShortcutItem alloc]initWithType:@"mycollection" localizedTitle:@"我的收藏" localizedSubtitle:nil icon:collectionShortIcon userInfo:nil];
    [UIApplication sharedApplication].shortcutItems = @[collectionShortItem];
    NSLog(@"动态添加shortcutItem");
    return YES;
}



//3dtouch
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    if ([shortcutItem.type isEqualToString:@"mycollection"]) {
        NSLog(@"我的收藏");
    }

}

@end
