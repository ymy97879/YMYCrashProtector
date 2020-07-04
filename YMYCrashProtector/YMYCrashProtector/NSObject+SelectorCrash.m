//
//  NSObject+SelectorCrash.m
//  YMYCrashProtector
//
//  Created by ymy on 2020/7/4.
//  Copyright © 2020 ymy. All rights reserved.
//

#import "NSObject+SelectorCrash.h"
#import "NSObject+Swizzle.h"

@implementation UnrecognizedSelectorSolveObject


+ (BOOL)resolveInstanceMethod:(SEL)sel {
    class_addMethod([self class], sel, (IMP)addMethod, "v@:@");
    return YES;
}

id addMethod(id self, SEL _cmd) {
    NSLog(@"CrashProtector: unrecognized selector: %@", NSStringFromSelector(_cmd));
    return 0;
}

@end


@implementation NSObject (SelectorCrash)
+ (void)enableSelectorProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSObject *object = [[NSObject alloc] init];
        [object ymy_instanceSwizzleMethod:@selector(forwardingTargetForSelector:) replaceMethod:@selector(ymy_forwardingTargetForSelector:)];
    });
}

- (id)ymy_forwardingTargetForSelector:(SEL)aSelector {
    if (class_respondsToSelector([self class], @selector(forwardInvocation:))) {
        IMP impOfNSObject = class_getMethodImplementation([NSObject class], @selector(forwardInvocation:));
        IMP imp = class_getMethodImplementation([self class], @selector(forwardInvocation:));
        if (imp != impOfNSObject) {
            //NSLog(@"class has implemented invocation");
            return nil;
        }
    }
    
    UnrecognizedSelectorSolveObject *solveObject = [UnrecognizedSelectorSolveObject new];
    solveObject.objc = self;
    return solveObject;
}

@end

