//
//  LoginVC.h
//  SOUN
//
//  Created by Apple Developer on 4/5/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController<UITextFieldDelegate>

@property (nonatomic, assign) BOOL isLoading;


@property (strong, nonatomic) UITextField *currentTextField;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIButton *signinButton;


- (IBAction)signin:(id)sender;

@end
