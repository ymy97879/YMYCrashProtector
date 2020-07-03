//
//  NSString+Crash.h
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
*  1. - (unichar)characterAtIndex:(NSUInteger)index
*  2. - (NSString *)substringFromIndex:(NSUInteger)from
*  3. - (NSString *)substringToIndex:(NSUInteger)to {
*  4. - (NSString *)substringWithRange:(NSRange)range {
*  5. - (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement
*  6. - (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
*  7. - (NSString *)stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement
*

stringByReplacingOccurrencesOfString:withString: 实际调用的是stringByReplacingOccurrencesOfString:withString:options:range:


*/
@interface NSString (Crash)
+(void)enableStringProtector;
@end

NS_ASSUME_NONNULL_END
