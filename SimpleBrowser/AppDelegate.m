//
//  AppDelegate.m
//  SimpleBrowser
//
//  Created by rost on 23.12.13.
//  Copyright (c) 2013 rost. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    RootViewController *rootVC = [[RootViewController alloc] init];
    self.nc = [[UINavigationController alloc] initWithRootViewController:rootVC];
    self.window.rootViewController = self.nc;
    
    [self.window makeKeyAndVisible];
    return YES;
}


@end
