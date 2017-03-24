//
//  MySidePanelController.m
//  CustomKeyboardGallery
//
//  Created by Urucode on 7/25/14.
//  Copyright (c) 2014 UruCode. All rights reserved.
//

#import "MySidePanelController.h"

@interface MySidePanelController ()


@end

@implementation MySidePanelController


- (void)viewDidLoad
{
    self.leftGapPercentage = 260.0f / 320.0f;
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) awakeFromNib {
//    MainVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainVC"];
//    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController: vc];
//    [self setCenterPanel:navController];
//    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"LeftPanelViewController"]];
    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"]];
    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"]];
//    [self setRightPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"rightViewcontroller"]];
}

@end
