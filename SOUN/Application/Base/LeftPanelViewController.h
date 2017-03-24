//
//  LeftPanelViewController.h
//  DomumLink
//
//  Created by AnMac on 1/15/15.
//  Copyright (c) 2015 Petr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftPanelViewController : UIViewController <SliderPanelDelegate>
   
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UIButton *signoutButton;

- (IBAction)navToPages:(id)sender;
- (IBAction)signout:(id)sender;
@end
