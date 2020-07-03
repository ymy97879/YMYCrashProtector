//
//  NSTimer+Crash.h
//  YMYCrashProtector
//
//  Created by ymy on 2020/7/3.
//  Copyright © 2020 ymy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/*
 使用NSTimer的 scheduledTimerWithTimeInterval:target:selector:userInfo:repeats: 接口做重复性的
 定时任务时存在一个问题：NSTimer会 强引用 target实例，所以需要在合适的时机invalidate 定时器，否则就会由于
 定时器timer强引用target的关系导致 target不能被释放，造成内存泄露，甚至在定时任务触发时导致crash。crash
 的展现形式和具体的target执行的selector有关。
 
 
👇：
 
 点击屏幕时，系统会通过【scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:】生成一个NSTimer 来记录手指按住屏幕时的时长
 
 */

/**
 桥接层
 
 NSTimer强引用CPWeakProxy， WOCPWeakProxy弱引用target
 
 这样target和NSTimer之间的关系也就是弱引用了，意味着target可以自由的释放，从而解决了循环引用的问题
 
 */

@interface CPWeakProxy: NSProxy

@property (nonatomic, weak, readonly) id target;

- (instancetype)initWithTarget:(id)target;

+ (instancetype)proxyWithTarget:(id)target;

@end

@interface NSTimer (Crash)
+ (void)ymy_enableTimerProtector;

@end

NS_ASSUME_NONNULL_END
