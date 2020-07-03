//
//  NSTimer+Crash.m
//  YMYCrashProtector
//
//  Created by ymy on 2020/7/3.
//  Copyright © 2020 ymy. All rights reserved.
//

#import "NSTimer+Crash.h"
#import "NSObject+Swizzle.h"


@implementation CPWeakProxy

- (instancetype)initWithTarget:(id)target{
    _target = target;
    return self;
}

+(instancetype)proxyWithTarget:(id)target{
    return [[CPWeakProxy alloc]initWithTarget:target];
}

//当不能识别方法时候,就会调用这个方法,在这个方法中,我们可以将不能识别的传递给其它对象处理
//由于这里对所有的不能处理的都传递给_target了,所以methodSignatureForSelector和forwardInvocation不可能被执行的,所以不用再重载了吧
//其实还是需要重载methodSignatureForSelector和forwardInvocation的,为什么呢?因为_target是弱引用的,所以当_target可能释放了,当它被释放了的情况下,那么forwardingTargetForSelector就是返回nil了.然后methodSignatureForSelector和forwardInvocation没实现的话,就直接crash了!!!
//这也是为什么这两个方法中随便写的!!!

//转发目标选择器
- (id)forwardingTargetForSelector:(SEL)selector{
    return _target;
}

//函数执行器
-(void)forwardInvocation:(NSInvocation *)invocation{
    void *null = NULL;
    [invocation setReturnValue:&null];
}

//方法签名的选择器
-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

- (BOOL)respondsToSelector:(SEL)aSelector{
    return [_target respondsToSelector:aSelector];
}

- (BOOL)isEqual:(id)object{
    return [_target isEqual:object];
}

- (NSUInteger)hash {
    return [_target hash];
}

- (Class)superclass{
    return [_target superclass];
}
- (BOOL)isKindOfClass:(Class)aClass{
    return [_target isKindOfClass:aClass];
}
- (BOOL)isMemberOfClass:(Class)aClass{
    return [_target isMemberOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol{
    return [_target conformsToProtocol:aProtocol];
}

- (BOOL)isProxy{
    return YES;
}
- (NSString *)description{
    return [_target description];
}
- (NSString *)debugDescription{
    return [_target debugDescription];
}

@end


@implementation NSTimer (Crash)

+ (void)enableTimerProtector{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSTimer ymy_classSwizzleMethod:@selector(scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:) replaceMethod:@selector(ymy_scheduledTimerWithTimerInterval:target:selector:userInfo:repeats:)];
        [NSTimer ymy_classSwizzleMethod:@selector(timerWithTimeInterval:target:selector:userInfo:repeats:) replaceMethod:@selector(ymy_timerWithTimeInterval:target:selector:userInfo:repeats:)];
    });
}

+ (NSTimer *)ymy_scheduledTimerWithTimerInterval:(NSTimeInterval)timeInterval target:(id)target selector:(SEL)selector userInfo:(id)userInfo repeats:(BOOL)repeats{
    return [self ymy_scheduledTimerWithTimerInterval:timeInterval target:[CPWeakProxy proxyWithTarget:target] selector:selector userInfo:userInfo repeats:repeats];
}
+ (NSTimer *)ymy_timerWithTimeInterval:(NSTimeInterval)timeInterval target:(id)target selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    
    NSLog(@"CrashProtector - warring: ymy_timerWithTimeInterval");
    return [self ymy_timerWithTimeInterval:timeInterval target:target selector:aSelector userInfo:userInfo repeats:yesOrNo];
}

@end
