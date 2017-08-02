//
//  SOAComponentAppDelegate.h
//  SOA_Demo
//
//         我有一壶酒,足以慰风尘
//         倾倒江海里,共饮天下人
//
//  Created by 马金丽 on 17/8/1.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SOAComponentAppDelegate : NSObject


+ (instancetype)shareInstance;


-(NSMutableArray *)services;
@end
