//
//  YMYCrashManager.m
//  YMYCrashProtector
//
//  Created by ymy on 2020/6/27.
//  Copyright © 2020 ymy. All rights reserved.
//

#import "YMYCrashManager.h"
#import "NSObject+KVOCrash.h"
#import "NSTimer+Crash.h"
#import "NSObject+KVOCrash.h"
#import "NSTimer+Crash.h"
#import "NSArray+Crash.h"
#import "NSMutableArray+Crash.h"
#import "NSDictionary+Crash.h"
#import "NSMutableDictionary+Crash.h"
#import "NSString+Crash.h"
#import "NSMutableString+Crash.h"
#import "NSAttributedString+Crash.h"
#import "NSMutableAttributedString+Crash.h"


@implementation YMYCrashManager


+ (void)makeAllEffective {
    [self startAllComponents];
}

+ (void)configCrashProtectorService:(CrashProtectorStyle)protectorType {
   
    switch (protectorType) {
        case CrashProtectorNone:
            
            break;
        case CrashProtectorAll:
        {
            [self startAllComponents];
        }
            break;
        case CrashProtectorUnrecognizedSelector:
//            [NSObject wo_enableSelectorProtector];
            break;
        case CrashProtectorKVO:
            [NSObject enableKVOProtector];
            break;
        case CrashProtectorNotification:
//            [NSObject wo_enableNotificationProtector];
            break;
        case CrashProtectorTimer:
            [NSTimer enableTimerProtector];
            break;
        case CrashProtectorContainer: {
            [NSArray enableArrayProtector];
            [NSMutableArray enableMutableArrayProtector];

            [NSDictionary enableDictionaryProtector];
            [NSMutableDictionary enableMutableDictionaryProtector];
        }
            break;
        case CrashProtectorString: {
            [NSString enableStringProtector];
            [NSMutableString enableMutableStringProtector];

            [NSAttributedString enableAttributedStringProtector];
            [NSMutableAttributedString enableMutableAttributedStringProtector];
        }
            break;
            
        default:
            break;
    }
}


+ (void)startAllComponents {
//    [NSObject wo_enableSelectorProtector];
    [NSObject enableKVOProtector];
//    [NSObject wo_enableNotificationProtector]; // 可能会有性能问题，dealloc里面加了判断，系统的每个对象dealloc时都会调用
//
    [NSTimer enableTimerProtector];
    [NSArray enableArrayProtector];
    [NSMutableArray enableMutableArrayProtector];

    [NSDictionary enableDictionaryProtector];
    [NSMutableDictionary enableMutableDictionaryProtector];

    [NSString enableStringProtector];
    [NSMutableString enableMutableStringProtector];

    [NSAttributedString enableAttributedStringProtector];
    [NSMutableAttributedString enableMutableAttributedStringProtector];
}

@end

