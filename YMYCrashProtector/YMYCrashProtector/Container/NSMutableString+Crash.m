//
//  NSMutableString+Crash.m
//  YMYCrashProtector
//
//  Created by ymy on 2020/7/3.
//  Copyright © 2020 ymy. All rights reserved.
//

#import "NSMutableString+Crash.h"
#import "NSObject+Swizzle.h"

@implementation NSMutableString (Crash)
+ (void)enableMutableStringProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class __NSCFString = NSClassFromString(@"__NSCFString");
        
        //replaceCharactersInRange
        [self ymy_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(replaceCharactersInRange:withString:) replaceMethod:@selector(ymy_replaceCharactersInRange:withString:)];
        
        //insertString:atIndex:
        [self ymy_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(insertString:atIndex:) replaceMethod:@selector(ymy_insertString:atIndex:)];

        //deleteCharactersInRange
        [self ymy_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(deleteCharactersInRange:) replaceMethod:@selector(ymy_deleteCharactersInRange:)];
    });
}

#pragma mark - replaceCharactersInRange
- (void)ymy_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    @try {
        [self ymy_replaceCharactersInRange:range withString:aString];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnIgnore];
    }
    @finally {
    }
}

#pragma mark - insertString:atIndex:
- (void)ymy_insertString:(NSString *)aString atIndex:(NSUInteger)loc {
    
    @try {
        [self ymy_insertString:aString atIndex:loc];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnIgnore];
    }
    @finally {
    }
}

#pragma mark - deleteCharactersInRange

- (void)ymy_deleteCharactersInRange:(NSRange)range {
    
    @try {
        [self ymy_deleteCharactersInRange:range];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnIgnore];
    }
    @finally {
    }
}

@end

