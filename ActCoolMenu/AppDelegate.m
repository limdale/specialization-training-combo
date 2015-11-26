//
//  AppDelegate.m
//  ActCoolMenu
//
//  Created by Dale Ansley Lim on 11/26/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import "AppDelegate.h"
#import "CoolMenuViewController.h"
#import "RandomViewController.h"
#import "ListViewController.h"
#import "AboutViewController.h"
#import "TextStylerViewController.h"
#import "AddQuoteViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    CoolMenuViewController *coolMenuViewController = [[CoolMenuViewController alloc] init];
    UITabBarController *tabController = [[UITabBarController alloc] init];
    TextStylerViewController *textStylerController = [[TextStylerViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:coolMenuViewController];
    [coolMenuViewController setNavigationController:nav];
    
    // setup memorable quote controllers
    ListViewController *table = [[ListViewController alloc] init];
    RandomViewController *random = [[RandomViewController alloc] init];
    AddQuoteViewController *add = [[AddQuoteViewController alloc] init];
    AboutViewController *about = [[AboutViewController alloc] init];
    [table setNavigationController:nav];
    NSArray *controllerArray = @[random, table, add, about];
    [tabController setViewControllers:controllerArray];
    
    //setup controller references
    [coolMenuViewController setTabViewController:tabController];
    [coolMenuViewController setTextStylerViewController:textStylerController];
    
    self.window.rootViewController = nav;
    //self.window.rootViewController = [[AddQuoteViewController alloc] init];
    
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
