//
//  NSString+Crash.m
//  YMYCrashProtector
//
//  Created by ymy on 2020/7/3.
//  Copyright © 2020 ymy. All rights reserved.
//

#import "NSString+Crash.h"
#import "NSObject+Swizzle.h"

@implementation NSString (Crash)

+ (void)enableStringProtector{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSCFConstantString = NSClassFromString(@"__NSCFConstantString");
        
               //substringFromIndex
               [self ymy_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(substringFromIndex:) replaceMethod:@selector(ymy_substringFromIndex:)];
               
               //substringToIndex
               [self ymy_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(substringToIndex:) replaceMethod:@selector(ymy_substringToIndex:)];
               
               //substringWithRange:
               [self ymy_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(substringWithRange:) replaceMethod:@selector(ymy_substringWithRange:)];
               
               //characterAtIndex
               [self ymy_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(characterAtIndex:) replaceMethod:@selector(ymy_characterAtIndex:)];
               
               /* 注意swizzling先后顺序 👇： */
               //stringByReplacingOccurrencesOfString:withString:options:range:
               [self ymy_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) replaceMethod:@selector(ymy_stringByReplacingOccurrencesOfString:withString:options:range:)];

               //stringByReplacingCharactersInRange:withString:
               [self ymy_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(stringByReplacingCharactersInRange:withString:) replaceMethod:@selector(ymy_stringByReplacingCharactersInRange:withString:)];
    });
}
//=================================================================
//                           characterAtIndex:
//=================================================================
#pragma mark - characterAtIndex:

- (unichar)ymy_characterAtIndex:(NSUInteger)index {
    
    unichar characteristic;
    @try {
        characteristic = [self ymy_characterAtIndex:index];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to return a without assign unichar.";
        [YMYCrashLog noteErrorWithException:exception attachedTODO:defaultToDo];
    }
    @finally {
        return characteristic;
    }
}

#pragma mark - substringFromIndex:

- (NSString *)ymy_substringFromIndex:(NSUInteger)from {
    
    NSString *subString = nil;
    
    @try {
        subString = [self ymy_substringFromIndex:from];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnNil];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

#pragma mark - substringToIndex
- (NSString *)ymy_substringToIndex:(NSUInteger)index {
    
    NSString *subString = nil;
    
    @try {
        subString = [self ymy_substringToIndex:index];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnNil];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

#pragma mark - stringByReplacingCharactersInRange:withString:

- (NSString *)ymy_stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self ymy_stringByReplacingCharactersInRange:range withString:replacement];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnNil];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

- (NSString *)ymy_stringByReplacingOccurrencesOfString:(NSRange)range withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self ymy_stringByReplacingOccurrencesOfString:range withString:replacement];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnNil];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

#pragma mark - stringByReplacingOccurrencesOfString:withString:options:range:

- (NSString *)ymy_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self ymy_stringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnNil];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

#pragma mark - substringWithRange:
- (NSString *)ymy_substringWithRange:(NSRange)range {
    
    NSString *subString = nil;
    
    @try {
        subString = [self ymy_substringWithRange:range];
    }
    @catch (NSException *exception) {
        [YMYCrashLog noteErrorWithException:exception attachedTODO:CrashDefaultReturnNil];
        subString = nil;
    }
    @finally {
        return subString;
    }
}
@end
