//
//  AppDelegate.m
//  SOA_Demo
//
//  Created by 马金丽 on 17/8/1.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "AppDelegate.h"
#import "SOAComponentAppDelegate.h"
#import "NetWorkService.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    for (id <UIApplicationDelegate>service in [[SOAComponentAppDelegate shareInstance] services]) {
        if ([service respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
            [service application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    for (id<UIApplicationDelegate>service in [[SOAComponentAppDelegate shareInstance] services]) {
        if ([service respondsToSelector:@selector(applicationDidEnterBackground:)]) {
            [service applicationDidEnterBackground:application];
        }
    }
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    for (id<UIApplicationDelegate>service in [[SOAComponentAppDelegate shareInstance] services]) {
        if ([service respondsToSelector:@selector(applicationWillEnterForeground:)]) {
            [service applicationWillEnterForeground:application];
        }
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    for (id<UIApplicationDelegate>service in [[SOAComponentAppDelegate shareInstance] services]) {
        if ([service respondsToSelector:@selector(application:performActionForShortcutItem:completionHandler:)]) {
            [service application:application performActionForShortcutItem:shortcutItem completionHandler:completionHandler];
        }
    }
}

@end
