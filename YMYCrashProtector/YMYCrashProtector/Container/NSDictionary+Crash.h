//
//  NSDictionary+Crash.h
//  YMYCrashProtector
//
//  Created by ymy on 2020/7/3.
//  Copyright © 2020 ymy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
*  Can avoid crash method
*
*  1. NSDictionary的快速创建方式 NSDictionary *dict = @{@"frameWork" : @"AvoidCrash"}; //这种创建方式其实调用的是2中的方法
*  2. +(instancetype)dictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt
*
*/
@interface NSDictionary (Crash)
+ (void)enableDictionaryProtector;

@end

NS_ASSUME_NONNULL_END
