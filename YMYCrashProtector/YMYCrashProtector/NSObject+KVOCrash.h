//
//  NSObject+KVOCrash.h
//  YMYCrashProtector
//
//  Created by ymy on 2020/6/27.
//  Copyright © 2020 ymy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CPKVOInfo;

typedef void (^CPKVONotificationBlock)(id _Nullable observer, id _Nullable object, NSDictionary<NSKeyValueChangeKey, id> * _Nullable change);

/**
 KVO的管理者
 KVO Crash fix
 */
@interface KVOProxy :NSObject
//添加观察者
- (BOOL)ymy_addObserver:(id _Nullable )object KVOinfo:(CPKVOInfo *_Nullable)KVOInfo;
//移出指定的观察者
- (void)ymy_removeObserver:(id _Nullable )object keyPath:(NSString *_Nullable)keyPath block:(void(^_Nullable)(void)) block;
//移出所有观察者
- (void)ymy_removeAllObserver;

@end

/**
 KVO配置层
 */
@interface CPKVOInfo : NSObject

- (instancetype _Nullable )initWithKeyPath:(NSString *_Nullable)keyPath options:(NSKeyValueObservingOptions)options context:(void *_Nullable)context;

@end

@interface NSObject (KVOCrash)
@property (nonatomic, strong) KVOProxy * _Nullable KVOProxy;

+ (void)enableKVOProtector;
@end

NS_ASSUME_NONNULL_END
