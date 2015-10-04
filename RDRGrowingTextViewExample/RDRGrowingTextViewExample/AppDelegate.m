//
//  AppDelegate.m
//  RDRGrowingTextViewExample
//
//  Created by Damiaan Twelker on 04/10/15.
//  Copyright (c) 2015 Damiaan Twelker. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate {
    UINavigationController *_rootViewController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _rootViewController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = _rootViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
