//
//  NSMutableAttributedString+Crash.m
//  YMYCrashProtector
//
//  Created by ymy on 2020/7/3.
//  Copyright © 2020 ymy. All rights reserved.
//

#import "NSMutableAttributedString+Crash.h"
#import "NSObject+Swizzle.h"

@implementation NSMutableAttributedString (Crash)
+ (void)enableAttributedStringProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class NSConcreteAttributedString = NSClassFromString(@"NSConcreteAttributedString");
        
        //initWithString:
        [self ymy_instanceSwizzleMethodWithClass:NSConcreteAttributedString orginalMethod:@selector(initWithString:) replaceMethod:@selector(ymy_initWithString:)];
        //initWithAttributedString
        [self ymy_instanceSwizzleMethodWithClass:NSConcreteAttributedString orginalMethod:@selector(initWithAttributedString:) replaceMethod:@selector(ymy_initWithAttributedString:)];

        //initWithString:attributes:
        [self ymy_instanceSwizzleMethodWithClass:NSConcreteAttributedString orginalMethod:@selector(initWithString:attributes:) replaceMethod:@selector(ymy_initWithString:attributes:)];
    });
}

- (instancetype)ymy_initWithString:(NSString *)str {
    id object = nil;
    
    @try {
        object = [self ymy_initWithString:str];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnNil];
    }
    @finally {
        return object;
    }
}

#pragma mark - initWithAttributedString
- (instancetype)ymy_initWithAttributedString:(NSAttributedString *)attrStr {
    id object = nil;
    
    @try {
        object = [self ymy_initWithAttributedString:attrStr];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnNil];
    }
    @finally {
        return object;
    }
}

#pragma mark - initWithString:attributes:

- (instancetype)ymy_initWithString:(NSString *)str attributes:(NSDictionary<NSString *,id> *)attrs {
    id object = nil;
    
    @try {
        object = [self ymy_initWithString:str attributes:attrs];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnNil];
    }
    @finally {
        return object;
    }
}

@end
