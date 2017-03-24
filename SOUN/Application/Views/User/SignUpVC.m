//
//  SignUpVC.m
//  SOUN
//
//  Created by Apple Developer on 4/13/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "SignUpVC.h"

@interface SignUpVC ()

@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
    _usernameTextField.delegate = self;
    _emailTextField.delegate = self;
    _phoneNumberTextField.delegate = self;
    _passwordTextField.delegate = self;
    _confirmPasswordTextField.delegate = self;
    
    [commonUtils setRoundedView:_signupButton radius:_signupButton.frame.size.height/2];
    
    //  Hide keyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    //  Move up Screen
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

//    Hide Keyboard
- (void)dismissKeyboard {
    [_currentTextField resignFirstResponder];
}


//    Move up Screen
- (void)keyboardWillShow:(NSNotification *)notification {
    CGFloat keyboardHeight = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
    CGFloat textFieldY = _currentTextField.frame.origin.y;
    CGFloat textFieldHeight = _currentTextField.frame.size.height;
    CGFloat containerOffset = _containerView.frame.origin.y;
    CGFloat containerHeight = _containerView.frame.size.height;
    
    CGFloat movementDistance = containerHeight + _navigationBarView.frame.size.height - (textFieldY + textFieldHeight + keyboardHeight + containerOffset + 10);
    
    if (movementDistance > 0)
        return;
    
    _containerView.frame = CGRectOffset(_containerView.frame, 0, movementDistance);
}

- (void)keyboardWillHide:(NSNotification *)notification {
    _containerView.frame = CGRectMake(0, _navigationBarView.frame.size.height, _containerView.frame.size.width, _containerView.frame.size.height);
}


#pragma mark - TextField Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.currentTextField = textField;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    if (textField == _usernameTextField) {
        [_emailTextField becomeFirstResponder];
    } else if (textField == _emailTextField) {
        [_phoneNumberTextField becomeFirstResponder];
    } else if (textField == _phoneNumberTextField) {
        [_passwordTextField becomeFirstResponder];
    } else if (textField == _passwordTextField) {
        [_confirmPasswordTextField becomeFirstResponder];
    }
    
    return YES;
}


- (IBAction)signup:(id)sender {
    
    if(self.isLoading) return;
    
    NSString *userName          = self.usernameTextField.text;
    NSString *userEmail         = self.emailTextField.text;
    NSString *userPhoneNumber   = self.phoneNumberTextField.text;
    NSString *password          = self.passwordTextField.text;
    NSString *confirmPassword   = self.confirmPasswordTextField.text;
    
    if (![password isEqualToString:confirmPassword]) {
        
    }
    
    
    if([commonUtils isFormEmpty:[@[userName, userEmail, userPhoneNumber, password] mutableCopy]]) {
        [commonUtils showVAlertSimple:@"Warning" body:@"Please complete entire form" duration:1.2];
    } else {
        NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
        [paramDic setObject:userName forKey:@"user_name"];
        [paramDic setObject:userName forKey:@"user_name"];
        [paramDic setObject:userName forKey:@"user_name"];
        [paramDic setObject:password forKey:@"user_password"];
        
//        [self requestAPILogin:paramDic];
    }
    
    [[self navigationController] setNavigationBarHidden:YES];

    
    MySidePanelController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MySidePanelController"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
