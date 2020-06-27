//
//  YMYCrashManager.m
//  YMYCrashProtector
//
//  Created by ymy on 2020/6/27.
//  Copyright © 2020 ymy. All rights reserved.
//

#import "YMYCrashManager.h"
#import "NSObject+KVOCrash.h"
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
//            [NSTimer wo_enableTimerProtector];
            break;
        case CrashProtectorContainer: {
//            [NSArray wo_enableArrayProtector];
//            [NSMutableArray wo_enableMutableArrayProtector];
//
//            [NSDictionary wo_enableDictionaryProtector];
//            [NSMutableDictionary wo_enableMutableDictionaryProtector];
        }
            break;
        case CrashProtectorString: {
//            [NSString wo_enableStringProtector];
//            [NSMutableString wo_enableMutableStringProtector];
//
//            [NSAttributedString wo_enableAttributedStringProtector];
//            [NSMutableAttributedString wo_enableMutableAttributedStringProtector];
        }
            break;
            
        default:
            break;
    }
}


+ (void)startAllComponents {
//    [NSObject wo_enableSelectorProtector];
//    [NSObject wo_enableKVOProtector];
//    [NSObject wo_enableNotificationProtector]; // 可能会有性能问题，dealloc里面加了判断，系统的每个对象dealloc时都会调用
//
//    [NSTimer wo_enableTimerProtector];
//    [NSArray wo_enableArrayProtector];
//    [NSMutableArray wo_enableMutableArrayProtector];
//
//    [NSDictionary wo_enableDictionaryProtector];
//    [NSMutableDictionary wo_enableMutableDictionaryProtector];
//
//    [NSString wo_enableStringProtector];
//    [NSMutableString wo_enableMutableStringProtector];
//
//    [NSAttributedString wo_enableAttributedStringProtector];
//    [NSMutableAttributedString wo_enableMutableAttributedStringProtector];
}

@end

