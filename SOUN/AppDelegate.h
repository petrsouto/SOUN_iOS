//
//  AppDelegate.h
//  SOUN
//
//  Created by Apple Developer on 3/31/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, retain) CLLocationManager *locationManager;

- (void)updateLocationManager;

@end

