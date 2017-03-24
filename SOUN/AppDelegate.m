//
//  AppDelegate.m
//  SOUN
//
//  Created by Apple Developer on 3/31/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "AppDelegate.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.4];
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageControl.backgroundColor = [UIColor clearColor];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];

    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"ic_back.png"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"ic_back.png"]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [self updateLocationManager];
    
    return YES;
}

- (void)updateLocationManager {
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    [_locationManager setDistanceFilter:804.17f]; // Distance Filter as 0.5 mile (1 mile = 1609.34m)
    //locationManager.distanceFilter=kCLDistanceFilterNone;
    
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    //    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
    //        [_locationManager requestWhenInUseAuthorization];
    //    }
    
    if(IS_OS_8_OR_LATER) {
        [_locationManager requestAlwaysAuthorization];
    }
    [_locationManager startMonitoringSignificantLocationChanges];
    [_locationManager startUpdatingLocation];
    
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
