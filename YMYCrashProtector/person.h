//
//  person.h
//  YMYCrashProtector
//
//  Created by ymy on 2020/7/4.
//  Copyright © 2020 ymy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//==================================================
//   本类的作用是用来测试unrecoganized selector的处理情况
//==================================================
@interface person : NSObject
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age height:(float)height weight:(float)weight;
@end

NS_ASSUME_NONNULL_END
