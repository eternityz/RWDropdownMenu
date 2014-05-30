//
//  RWAppDelegate.m
//  RWDropdownMenuDemo
//
//  Created by Zhang Bin on 2014-05-30.
//  Copyright (c) 2014年 Zhang Bin. All rights reserved.
//

#import "RWAppDelegate.h"
#import "RWDemoViewController.h"

@implementation RWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    RWDemoViewController *vc = [[RWDemoViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
