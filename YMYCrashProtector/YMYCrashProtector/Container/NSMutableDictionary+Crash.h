//
//  NSMutableDictionary+Crash.h
//  YMYCrashProtector
//
//  Created by ymy on 2020/7/3.
//  Copyright © 2020 ymy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
* setValue forKey 的值可设置nil，不会crash
*
*  Can avoid crash method
*
*  1. - (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
*  2. - (void)removeObjectForKey:(id)aKey
*
*/
@interface NSMutableDictionary (Crash)
+ (void)enableMutableDictionaryProtector;
@end

NS_ASSUME_NONNULL_END
