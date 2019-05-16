//
//  Person.h
//  objc-test
//
//  Created by 石显军 on 2019/4/26.
//

#import <Foundation/Foundation.h>
#import "PersonProxy.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

- (void)run;

@property (nonatomic, strong) PersonProxy *methodProxy;

@end

NS_ASSUME_NONNULL_END
