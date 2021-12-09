//
//  SwizzeViewModel.m
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/15.
//  Copyright © 2021 杨冬青. All rights reserved.
//

#import "SwizzeViewModel.h"

#import <objc/runtime.h>

@implementation SwizzeViewModel

/*
+ (void)load {
    Method method = class_getInstanceMethod(self, @selector(test));
    Method newMethod = class_getInstanceMethod(self, @selector(swizzeTest));
    method_exchangeImplementations(method, newMethod);
}
 */

- (void)test {
    NSLog(@"SwizzeViewModel test");
}

@end
