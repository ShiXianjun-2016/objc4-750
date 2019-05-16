//
//  PersonProxy.m
//  objc-test
//
//  Created by 石显军 on 2019/4/26.
//

#import "PersonProxy.h"

@implementation PersonProxy

- (void)run
{
    NSLog(@"%s", __func__);
}


- (void)sxj_dealNotRecognizedMessage:(NSString *)errorMessage
{
    NSLog(@"errorMessage : %@", errorMessage);
}

@end
