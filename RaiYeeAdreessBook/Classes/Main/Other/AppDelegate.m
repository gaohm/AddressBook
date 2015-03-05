//
//  AppDelegate.m
//  RaiYeeAdreessBook
//
//  Created by ghm on 15-1-21.
//  Copyright (c) 2015年 HM. All rights reserved.
//

#import "AppDelegate.h"
#import "HMAddressTableViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2.显示窗口(成为主窗口)
    [self.window makeKeyAndVisible];

    // 3.添加导航控制器并设置为根控制器，导航控制器的主控制器设置为TableViewController
    HMAddressTableViewController *addTableViewCon = [[HMAddressTableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:addTableViewCon];
    addTableViewCon.title = @"通讯录";
    self.window.rootViewController = nav;
    
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
