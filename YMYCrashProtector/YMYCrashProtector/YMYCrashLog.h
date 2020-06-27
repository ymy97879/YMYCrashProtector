//
//  YMYCrashLog.h
//  YMYCrashProtector
//
//  Created by ymy on 2020/6/27.
//  Copyright © 2020 ymy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
static NSString * _Nullable CrashDefaultReturnNil = @"This framework default is to return nil to avoid crash";
static NSString * _Nullable CrashDefaultReturnIgnore = @"This framework default is to ignore this operation to avoid crash.";
@interface YMYCrashLog : NSObject

@property (nonatomic ,copy)NSString * _Nullable crashMsg;
//获取崩溃日志
-(void)getCrashMsg;

//打印崩溃日志
+ (void)printCrashMsg:(NSString *_Nullable)crashMsg;

+ (void)noteErrorWithException:(NSException *_Nonnull)exception attachedTODO:(NSString *_Nullable)todo;

@end

NS_ASSUME_NONNULL_END
