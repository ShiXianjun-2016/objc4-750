//
//  main.m
//  objc-test
//
//  Created by GongCF on 2018/12/16.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

#import "TestDemo.h"
#import "isa.h"

#   define SJ_ISA_MASK        0x00007ffffffffff8ULL

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // class_data_bits_t
        
        TestDemo *p = [TestDemo new];
        
        Class cls1 = p.class;
        Class cls2 = object_getClass(cls1);
        
        NSLog(@"%p - %p", cls1, cls2);
        
    }
    return 0;
}
