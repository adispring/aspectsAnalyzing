//
//  Dog.h
//  AspecetsDemo
//
//  Created by wangzengdi on 15/10/3.
//  Copyright © 2015年 adispring. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, assign) NSUInteger age;

- (void)bark;
- (void)eat:(NSString *)food;

+ (void)classMethod;

@end
