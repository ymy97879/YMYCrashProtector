//
//  NSArray+Crash.m
//  YMYCrashProtector
//
//  Created by ymy on 2020/7/3.
//  Copyright © 2020 ymy. All rights reserved.
//

#import "NSArray+Crash.h"
#import "NSObject+Swizzle.h"
/**

iOS 8:下都是__NSArrayI
iOS11: 之后分 __NSArrayI、  __NSArray0、__NSSingleObjectArrayI

iOS11之前：arr@[]  调用的是[__NSArrayI objectAtIndexed]
iOS11之后：arr@[]  调用的是[__NSArrayI objectAtIndexedSubscript]

arr为空数组
*** -[__NSArray0 objectAtIndex:]: index 12 beyond bounds for empty NSArray

arr只有一个元素
*** -[__NSSingleObjectArrayI objectAtIndex:]: index 12 beyond bounds [0 .. 0]

*/
@implementation NSArray (Crash)
+ (void)enableArrayProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //====================
        //   instance method
        //====================
        Class __NSArray = objc_getClass("NSArray");
        Class __NSArrayI = objc_getClass("__NSArrayI");
        Class __NSSingleObjectArrayI = objc_getClass("__NSSingleObjectArrayI");
        Class __NSArray0 = objc_getClass("__NSArray0");
        
        [self ymy_classSwizzleMethodWithClass:__NSArray orginalMethod:@selector(arrayWithObjects:count:) replaceMethod:@selector(ymy_arrayWithObjects:count:)];
        
        // objectAtIndex:
        /* 数组count >= 2 */
        [self ymy_instanceSwizzleMethodWithClass:__NSArrayI orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(ymy_objectAtIndex:)];//[arr objectAtIndex:];
        
        [self ymy_instanceSwizzleMethodWithClass:__NSArrayI orginalMethod:@selector(objectAtIndexedSubscript:) replaceMethod:@selector(ymy_objectAtIndexedSubscript:)];//arr[];
        
        /* 数组为空 */
        [self ymy_instanceSwizzleMethodWithClass:__NSArray0 orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(ymy_objectAtIndexedNullarray:)];
        
        /* 数组count == 1 */
        [self ymy_instanceSwizzleMethodWithClass:__NSSingleObjectArrayI orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(ymy_objectAtIndexedArrayCountOnlyOne:)];
        
        // objectsAtIndexes:
        [self ymy_instanceSwizzleMethodWithClass:__NSArray orginalMethod:@selector(objectsAtIndexes:) replaceMethod:@selector(ymy_objectsAtIndexes:)];
        
        // 以下方法调用频繁，替换可能会影响性能
        // getObjects:range:
        [self ymy_instanceSwizzleMethodWithClass:__NSArray orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(ymy_getObjectsNSArray:range:)];
        [self ymy_instanceSwizzleMethodWithClass:__NSSingleObjectArrayI orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(ymy_getObjectsNSSingleObjectArrayI:range:)];
        [self ymy_instanceSwizzleMethodWithClass:__NSArrayI orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(ymy_getObjectsNSArrayI:range:)];
        
    });
}

#pragma mark - instance array
+ (instancetype)ymy_arrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    
    id instance = nil;
    
    @try {
        instance = [self ymy_arrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to remove nil object and instance a array.";
        [YMYCrashLog noteErrorWithException:exception attachedTODO:defaultToDo];

        //以下是对错误数据的处理，把为nil的数据去掉,然后初始化数组
        NSInteger newObjsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] != nil) {
                newObjects[newObjsIndex] = objects[i];
                newObjsIndex++;
            }
        }
        instance = [self ymy_arrayWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }
}


- (id)ymy_objectAtIndex:(NSUInteger)index {
    
    id object = nil;
    @try {
        object = [self ymy_objectAtIndex:index];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (id)ymy_objectAtIndexedSubscript:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self ymy_objectAtIndexedSubscript:index];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (id)ymy_objectAtIndexedNullarray:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self ymy_objectAtIndexedNullarray:index];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (id)ymy_objectAtIndexedArrayCountOnlyOne:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self ymy_objectAtIndexedArrayCountOnlyOne:index];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (NSArray *)ymy_objectsAtIndexes:(NSIndexSet *)indexes {
    NSArray *returnArray = nil;
    @try {
        returnArray = [self ymy_objectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnNil];
        
    } @finally {
        return returnArray;
    }
}

#pragma mark getObjects:range:
- (void)ymy_getObjectsNSArray:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self ymy_getObjectsNSArray:objects range:range];
    } @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnIgnore];
    } @finally {
    }
}

- (void)ymy_getObjectsNSSingleObjectArrayI:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self ymy_getObjectsNSSingleObjectArrayI:objects range:range];
    } @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnIgnore];
    } @finally {
    }
}

- (void)ymy_getObjectsNSArrayI:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self ymy_getObjectsNSArrayI:objects range:range];
    } @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnIgnore];
    } @finally {
    }
}

@end

