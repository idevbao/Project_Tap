//
//  AppDelegate.m
//  UIGestureRecognizer_Xuly_DaCham
//
//  Created by Trúc Phương >_< on 29/01/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "AppDelegate.h"
#import "DieuPhoiDaCham.h"
#import "Custom_GR.h"
#import "openAPPlication_New.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
//    DieuPhoiDaCham * vcDP = [[DieuPhoiDaCham alloc] init];
    Custom_GR * vcCT = [[Custom_GR  alloc]init];
    UINavigationController * naviCtr = [[UINavigationController alloc] initWithRootViewController:[openAPPlication_New new]];
    self.window.rootViewController = naviCtr;
    [self.window makeKeyAndVisible];
    NSLog(@"didFinishLaunchingWithOptions: Hoan thanh khoi chay");
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    NSLog(@"applicationWillResignActive: Ung dung se bo trang thai kich hoat de sang chay ngam");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"applicationDidEnterBackground: App da chuyen qua chay ngam");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationWillEnterForeground: app hien thi ''Conten noi dung cho'' nguoi dung su dung");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"applicationDidBecomeActive: da chuyen sang Active ");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"application Will Terminate: app stop ");
}


@end
