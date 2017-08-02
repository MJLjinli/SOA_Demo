//
//  SOAComponentAppDelegate.m
//  SOA_Demo
//
//         我有一壶酒,足以慰风尘
//         倾倒江海里,共饮天下人
//
//  Created by 马金丽 on 17/8/1.
//  Copyright © 2017年 majinli. All rights reserved.
//


#import "SOAComponentAppDelegate.h"
#import "NetWorkService.h"
#import "SystemService.h"
@interface SOAComponentAppDelegate ()
{
    NSMutableArray *_allServices;
}
@end

@implementation SOAComponentAppDelegate


+ (instancetype)shareInstance
{
    static SOAComponentAppDelegate *share = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[SOAComponentAppDelegate alloc]init];
    });
    return share;
}

- (void)registeServices
{
    [self registeServie:[[NetWorkService alloc]init]];
    [self registeServie:[[SystemService alloc]init]];
}

- (void)registeServie:(id)service
{
    if (![_allServices containsObject:service]) {
        [_allServices addObject:service];
    }
}


- (NSMutableArray *)services
{
    if (!_allServices) {
        _allServices = [[NSMutableArray alloc]init];
        [self registeServices];
    }
    return _allServices;
}






@end
