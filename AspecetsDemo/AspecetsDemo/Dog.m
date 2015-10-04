//
//  Dog.m
//  AspecetsDemo
//
//  Created by wangzengdi on 15/10/3.
//  Copyright © 2015年 adispring. All rights reserved.
//

#import "Dog.h"
#import <objc/runtime.h>

@implementation Dog

- (void)eat:(NSString *)food
{
    NSLog(@"self = %@ ,self.class = %@, object_getClass(self) = %@, eat food: %@", self, self.class, object_getClass(self), food);
}

- (void)bark
{
    NSLog(@"wolf wooo~~~, woo~~~");
}

+ (void)classMethod
{
    NSLog(@"This is a Class Method!");
}



@end
