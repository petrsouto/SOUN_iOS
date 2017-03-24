//
//  SignUpVC.h
//  SOUN
//
//  Created by Apple Developer on 4/13/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpVC : BaseViewController<UITextFieldDelegate>

@property (nonatomic, assign) BOOL isLoading;

@property (strong, nonatomic) UITextField *currentTextField;

@property (weak, nonatomic) IBOutlet UIView *navigationBarView;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;


@property (strong, nonatomic) IBOutlet UIButton *signupButton;

- (IBAction)signup:(id)sender;

@end
