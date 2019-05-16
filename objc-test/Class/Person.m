//
//  Person.m
//  objc-test
//
//  Created by 石显军 on 2019/4/26.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

void dynamicMethodIMP(id self, SEL _cmd)
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == sel_registerName("run")) {

        class_addMethod(self, sel, (IMP)dynamicMethodIMP, "v@:");
        return YES;
        
    }
    return [super resolveInstanceMethod:sel];
}

+ (BOOL)resolveClassMethod:(SEL)sel
{
    return [super resolveClassMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if (self.methodProxy == nil) {
        self.methodProxy = [PersonProxy new];
    }
    
    if ([self.methodProxy respondsToSelector:aSelector]) {
        return self.methodProxy;
    }
    
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *sig = [PersonProxy instanceMethodSignatureForSelector:@selector(sxj_dealNotRecognizedMessage:)];
    return sig;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSString *dubugInfo = [NSString stringWithFormat:@"[debug] unRecognizedMessage: [%@] send message [%@]", NSStringFromClass(self.class), NSStringFromSelector(anInvocation.selector)];

    // 重定向
    [anInvocation setSelector:@selector(sxj_dealNotRecognizedMessage:)];
    [anInvocation setArgument:&dubugInfo atIndex:2];

    [anInvocation invokeWithTarget:[PersonProxy new]];
}

@end
