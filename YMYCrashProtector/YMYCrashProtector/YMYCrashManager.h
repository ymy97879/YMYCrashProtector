//
//  YMYCrashManager.h
//  YMYCrashProtector
//
//  Created by ymy on 2020/6/27.
//  Copyright © 2020 ymy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,CrashProtectorStyle){
    CrashProtectorNone = 0,//不开启
    CrashProtectorAll,//所有崩溃拦截开启
    CrashProtectorUnrecognizedSelector,//空方法防止崩溃
    CrashProtectorKVO ,//kvo防止崩溃
    CrashProtectorNotification ,//通知防止崩溃
    CrashProtectorTimer ,//时间防止崩溃
    CrashProtectorContainer ,
    CrashProtectorString ,//字符串截取防止崩溃
};
@interface YMYCrashManager : NSObject
@property(nonatomic ,assign)CrashProtectorStyle style;

/**
 启动所有组件
 */
+ (void)makeAllEffective;

/**
 @param protectorType 启动的组件类型
 */
+ (void)configCrashProtectorService:(CrashProtectorStyle)protectorType;


@end

NS_ASSUME_NONNULL_END
