//
//  WelcomeRootVC.h
//  SOUN
//
//  Created by Apple Developer on 4/5/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeRootVC : UIViewController<UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (strong, nonatomic) IBOutlet UIButton *skipButton;
@end
