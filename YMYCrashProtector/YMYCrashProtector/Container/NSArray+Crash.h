//
//  NSArray+Crash.h
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
*  1. NSArray的快速创建方式 NSArray *array = @[@"chenfanfang", @"AvoidCrash"];  //这种创建方式其实调用的是2中的方法
*  2. +(instancetype)arrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt
*  3. - (id)objectAtIndex:(NSUInteger)index
*  4. - (void)getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range
*/
@interface NSArray (Crash)
+ (void)enableArrayProtector;
@end

NS_ASSUME_NONNULL_END
