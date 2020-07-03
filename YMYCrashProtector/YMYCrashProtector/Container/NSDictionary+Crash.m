//
//  NSDictionary+Crash.m
//  YMYCrashProtector
//
//  Created by ymy on 2020/7/3.
//  Copyright © 2020 ymy. All rights reserved.
//

#import "NSDictionary+Crash.h"
#import "NSObject+Swizzle.h"

@implementation NSDictionary (Crash)
+ (void)enableDictionaryProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // __NSPlaceholderDictionary
        [self ymy_classSwizzleMethodWithClass:self orginalMethod:@selector(dictionaryWithObjects:forKeys:count:) replaceMethod:@selector(ymy_dictionaryWithObjects:forKeys:count:)];
    });
}

+ (instancetype)ymy_dictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt {
    
    id instance = nil;
    @try {
        instance = [self ymy_dictionaryWithObjects:objects forKeys:keys count:cnt];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to remove nil key-values and instance a dictionary.";
        [YMYCrashLog noteErrorWithException:exception attachedTODO:defaultToDo];
        
        //处理错误的数据，然后重新初始化一个字典
        NSUInteger index = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        id  _Nonnull __unsafe_unretained newkeys[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] && keys[i]) {
                newObjects[index] = objects[i];
                newkeys[index] = keys[i];
                index++;
            }
        }
        instance = [self ymy_dictionaryWithObjects:newObjects forKeys:newkeys count:index];
    }
    @finally {
        return instance;
    }
}

@end

