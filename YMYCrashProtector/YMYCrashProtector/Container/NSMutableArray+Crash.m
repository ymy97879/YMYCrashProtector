//
//  NSMutableArray+Crash.m
//  YMYCrashProtector
//
//  Created by ymy on 2020/7/3.
//  Copyright © 2020 ymy. All rights reserved.
//

#import "NSMutableArray+Crash.h"
#import "NSObject+Swizzle.h"

@implementation NSMutableArray (Crash)
+ (void)enableMutableArrayProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //====================
        //   instance method
        //====================
        Class __NSArrayM = NSClassFromString(@"__NSArrayM");

        
        // objectAtIndex:
        [self ymy_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(wo_objectAtIndex:)];
        
        [self ymy_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(objectAtIndexedSubscript:) replaceMethod:@selector(wo_objectAtIndexedSubscript:)];

        //insertObject:atIndex:
        [self ymy_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(insertObject:atIndex:) replaceMethod:@selector(wo_insertObject:atIndex:)];

        //removeObjectAtIndex:
        [self ymy_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(removeObjectAtIndex:) replaceMethod:@selector(wo_removeObjectAtIndex:)];

        //setObject:atIndexedSubscript:
        [self ymy_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(setObject:atIndexedSubscript:) replaceMethod:@selector(wo_setObject:atIndexedSubscript:)];

        [self ymy_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(wo_getObjects:range:)];

    });
}

- (id)wo_objectAtIndex:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self wo_objectAtIndex:index];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (id)wo_objectAtIndexedSubscript:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self wo_objectAtIndex:index];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (void)wo_insertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self wo_insertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)wo_removeObjectAtIndex:(NSUInteger)index {
    @try {
        [self wo_removeObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)wo_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    @try {
        [self wo_setObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)wo_getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self wo_getObjects:objects range:range];
    } @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:@""];
    } @finally {
    }
}

@end

