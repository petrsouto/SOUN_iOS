//
//  BaseViewController.h
//  SOUN
//
//  Created by Apple Developer on 4/14/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, assign) BOOL isLoadingBase;

- (IBAction)menuClicked:(id)sender;
- (IBAction)menuBackClicked:(id)sender;

@end
