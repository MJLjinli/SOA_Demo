//
//  NetWorkService.m
//  SOA_Demo
//
//         我有一壶酒,足以慰风尘
//         倾倒江海里,共饮天下人
//
//  Created by 马金丽 on 17/8/1.
//  Copyright © 2017年 majinli. All rights reserved.
//


#import "NetWorkService.h"

#import <AFNetworking/AFHTTPSessionManager.h>

@interface NetWorkService ()

@end

@implementation NetWorkService


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self startNetWorkMonitoring];
    return YES;
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self addNotication];
    [self stopNetWorkMonitoring];
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [self startNetWorkMonitoring];
}



/**
 开启网络监测
 */
- (void)startNetWorkMonitoring
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
       
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:    //未知网络
            {
                NSLog(@"未知网络");
                break;
            }
            case AFNetworkReachabilityStatusNotReachable:   //没有网络
            {
                NSLog(@"没有网络");

                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:   //WIFI
            {
                NSLog(@"WIFI");

                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:   //手机自带网络
            {
                NSLog(@"手机自带网");
                break;
            }
                
            default:
                break;
        }
    }];
    [manager startMonitoring];
    NSLog(@"开启网络监测");
}


/**
 关闭网络监测
 */
- (void)stopNetWorkMonitoring
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager manager];
    [manager stopMonitoring];
    NSLog(@"关闭网络监测");
}


- (void)addNotication
{
    NSLog(@"添加通知");
}

@end
