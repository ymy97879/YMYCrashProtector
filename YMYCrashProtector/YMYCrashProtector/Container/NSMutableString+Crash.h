//
//  NSMutableString+Crash.h
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
*  1. 由于NSMutableString是继承于NSString,所以这里和NSString有些同样的方法就不重复写了
*  2. - (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)aString
*  3. - (void)insertString:(NSString *)aString atIndex:(NSUInteger)loc
*  4. - (void)deleteCharactersInRange:(NSRange)range
*
*/
@interface NSMutableString (Crash)
+ (void)enableMutableStringProtector;

@end

NS_ASSUME_NONNULL_END
