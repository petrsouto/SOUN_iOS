//
//  LeftPanelViewController.m
//  DomumLink
//
//  Created by AnMac on 1/15/15.
//  Copyright (c) 2015 Petr. All rights reserved.
//

#import "LeftPanelViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MySidePanelController.h"

@interface LeftPanelViewController ()

@property (nonatomic, strong) NSMutableArray *menuPages;

@end

@implementation LeftPanelViewController
@synthesize menuPages;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.sidePanelController.slideDelegate = self;
    
    [self initView];
}

- (void)initView {
    [commonUtils setRoundedView:_signoutButton radius:_signoutButton.frame.size.height/2];
}

- (void)viewDidLayoutSubviews {
    CGRect containerFrame = self.containerView.frame;
    containerFrame.size.width = self.sidePanelController.leftVisibleWidth;
    [self.containerView setFrame:containerFrame];
}

#pragma mark -  Left Side Menu Show

- (void)onMenuShow {

}
- (void)onMenuHide {

}

#pragma mark - Page Transition
- (IBAction)navToPages:(id)sender {
    UIViewController *vc;
    switch ([sender tag]) {
        case 1:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ServicesVC"];
            break;
        case 2:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"HistoryVC"];
            break;
        case 3:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsVC"];
            break;
        default:
            break;
    }
    UINavigationController *navController = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];

    [navController setViewControllers:@[vc] animated:NO];
    self.sidePanelController.centerPanel = navController;
}


- (IBAction)signout:(id)sender {
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[LoginVC class]]) {
            [self.navigationController popToViewController:controller animated:YES];
            break;
        }
    }
}

@end

