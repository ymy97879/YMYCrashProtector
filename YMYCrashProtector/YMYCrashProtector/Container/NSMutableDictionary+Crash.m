//
//  NSMutableDictionary+Crash.m
//  YMYCrashProtector
//
//  Created by ymy on 2020/7/3.
//  Copyright © 2020 ymy. All rights reserved.
//

#import "NSMutableDictionary+Crash.h"
#import "NSObject+Swizzle.h"
@implementation NSMutableDictionary (Crash)
+ (void)enableMutableDictionaryProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class dictionaryM = NSClassFromString(@"__NSDictionaryM");
        
        //setObject:forKey:
        [self ymy_instanceSwizzleMethodWithClass:dictionaryM orginalMethod:@selector(setObject:forKey:) replaceMethod:@selector(ymy_setObject:forKey:)];
        
        // iOS11
        [self ymy_instanceSwizzleMethodWithClass:dictionaryM orginalMethod:@selector(setObject:forKeyedSubscript:) replaceMethod:@selector(ymy_setObject:forKeyedSubscript:)];

        
        //removeObjectForKey:
        [self ymy_instanceSwizzleMethodWithClass:dictionaryM orginalMethod:@selector(removeObjectForKey:) replaceMethod:@selector(ymy_removeObjectForKey:)];

    });
}

- (void)ymy_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    
    @try {
        [self ymy_setObject:anObject forKey:aKey];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)ymy_setObject:(id)anObject forKeyedSubscript:(id<NSCopying>)aKey {
    
    @try {
        [self ymy_setObject:anObject forKeyedSubscript:aKey];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)ymy_removeObjectForKey:(id)aKey {
    
    @try {
        [self ymy_removeObjectForKey:aKey];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

@end

