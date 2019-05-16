//
//  main.m
//  objc-test
//
//  Created by GongCF on 2018/12/16.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

#import "Person.h"
#import "isa.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        NSNumber *number = [[NSNumber alloc] initWithInteger:200];
//
//        NSLog(@"%p", number);
    
        Person *p = [Person alloc];
        
        objc_msgSend(p, @selector(run));
        
    }
    return 0;
}
