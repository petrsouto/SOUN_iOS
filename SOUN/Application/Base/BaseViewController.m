//
//  BaseViewController.m
//  SOUN
//
//  Created by Apple Developer on 4/14/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    if(![commonUtils checkKeyInDic:@"user_id" inDic:appController.currentUser] || ![commonUtils checkKeyInDic:@"user_photo_url" inDic:appController.currentUser] || ![commonUtils checkKeyInDic:@"user_name" inDic:appController.currentUser]) {
//        if([commonUtils getUserDefault:@"current_user_user_id"] != nil) {
//            appController.currentUser = [commonUtils getUserDefaultDicByKey:@"current_user"];
//        } else {
//            [self dismissViewControllerAnimated:YES completion:nil];
//        }
//    }
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self prefersStatusBarHidden];
    
    self.isLoadingBase = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden {
    return NO;
}

# pragma Top Menu Events
- (IBAction)menuClicked:(id)sender {
    if(self.isLoadingBase) return;
    [self.sidePanelController showLeftPanelAnimated: YES];
}

- (IBAction)menuBackClicked:(id)sender {
    if(self.isLoadingBase) return;
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)menuCloseClicked:(id)sender {
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[ServicesVC class]]) {
            [self.navigationController popToViewController:controller animated:YES];
            break;
        }
    }
}

@end
