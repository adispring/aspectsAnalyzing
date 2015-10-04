//
//  Target.m
//  AspecetsDemo
//
//  Created by wangzengdi on 15/10/4.
//  Copyright © 2015年 adispring. All rights reserved.
//

#import "Target.h"

@implementation Target

- (void)targetSelector
{
    NSLog(@"%@'s original selector: %@", self, NSStringFromSelector(_cmd));
}

@end
