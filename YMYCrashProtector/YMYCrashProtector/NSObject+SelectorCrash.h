//
//  NSObject+SelectorCrash.h
//  YMYCrashProtector
//
//  Created by ymy on 2020/7/4.
//  Copyright © 2020 ymy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UnrecognizedSelectorSolveObject : NSObject

@property (nonatomic, weak) NSObject *objc;

@end

@interface NSObject (SelectorCrash)
+ (void)enableSelectorProtector;
@end

NS_ASSUME_NONNULL_END
