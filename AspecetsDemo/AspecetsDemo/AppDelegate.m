//
//  AppDelegate.m
//  AspecetsDemo
//
//  Created by wangzengdi on 15/9/12.
//  Copyright (c) 2015年 adispring. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <Aspects.h>
#import "Dog.h"
#import "Target.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ViewController *aspectsController = [ViewController new];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:aspectsController];
    [self.window makeKeyAndVisible];
    
    Target *aTarget = [[Target alloc] init];
    [aTarget aspect_hookSelector:NSSelectorFromString(@"targetSelector")
                     withOptions:AspectPositionBefore
                      usingBlock:^(id<AspectInfo> aspectInfo) {
        NSLog(@"Hook targetSelector");
    }
                           error:NULL];
    [aTarget targetSelector];
     
    [Dog aspect_hookSelector:@selector(classMethod) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo) {
        NSLog(@"Dog will do Class Method!");
    }error:NULL];
    [Dog classMethod];
    
    [Dog aspect_hookSelector:@selector(eat:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo, NSString *food) {
        NSLog(@"Dog will eat: %@", food);
    }error:NULL];
    
    Dog *haskell = [[Dog alloc] init];
    [haskell aspect_hookSelector:NSSelectorFromString(@"bark") withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
        NSLog(@"After Dog barked!");
    }error:NULL];
    
    [Dog classMethod];
    [haskell eat:@"fish"];
    [haskell bark];
    
    [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
        NSLog(@"View Controller %@ will appear animated: %tu", aspectInfo.instance, animated);
    } error:NULL];
    
    [aspectsController aspect_hookSelector:NSSelectorFromString(@"buttonClicked") withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
        NSLog(@"View Controller %@ AspectPositionAfter button Clicked", aspectInfo.instance);
    } error:NULL];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
