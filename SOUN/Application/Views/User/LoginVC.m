//
//  LoginVC.m
//  SOUN
//
//  Created by Apple Developer on 4/5/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self initUI];
}

- (void)initUI {
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    _usernameTextField.delegate = self;
    _passwordTextField.delegate = self;
    
    [commonUtils setRoundedView:self.signinButton radius:self.signinButton.frame.size.height/2];
    
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
    CGFloat selfOffset = self.view.frame.origin.y;
    CGFloat selfHeight = self.view.frame.size.height;

    CGFloat movementDistance = selfHeight - (textFieldY + textFieldHeight + keyboardHeight + selfOffset + 10);
    
    if (movementDistance > 0)
        return;
    
    self.view.frame = CGRectOffset(self.view.frame, 0, movementDistance);
}

- (void)keyboardWillHide:(NSNotification *)notification {
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}




#pragma mark - TextField Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.currentTextField = textField;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    if (textField == _usernameTextField) {
        [_passwordTextField becomeFirstResponder];
    }
    
    return YES;
}

#pragma mark - IBActions
- (IBAction)signin:(id)sender {
    if(self.isLoading) return;
    
    NSString *userName = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    if([commonUtils isFormEmpty:[@[userName, password] mutableCopy]]) {
        [commonUtils showVAlertSimple:@"Warning" body:@"Please complete entire form" duration:1.2];
    } else {
        NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
        [paramDic setObject:userName forKey:@"user_name"];
        [paramDic setObject:password forKey:@"user_password"];
        
        [self requestAPILogin:paramDic];
    }
}

#pragma mark - API Request - User Login
- (void)requestAPILogin:(NSMutableDictionary *)dic {
    self.isLoading = YES;
    [commonUtils showActivityIndicatorColored:self.view];
    [NSThread detachNewThreadSelector:@selector(requestDataLogin:) toTarget:self withObject:dic];
}

- (void)requestDataLogin:(id) params {
    NSDictionary *resObj = nil;
    resObj = [commonUtils httpJsonRequest:API_URL_USER_LOGIN withJSON:(NSMutableDictionary *) params];
    self.isLoading = NO;
    [commonUtils hideActivityIndicator];
    if (resObj != nil) {
        NSDictionary *result = (NSDictionary *)resObj;
        NSDecimalNumber *status = [result objectForKey:@"status"];
        if([status intValue] == 1) {
            appController.currentUser = [result objectForKey:@"current_user"];
            [commonUtils setUserDefaultDic:@"current_user" withDic:appController.currentUser];
            
            [self performSelector:@selector(requestOverLogin) onThread:[NSThread mainThread] withObject:nil waitUntilDone:YES];
        } else {
            NSString *msg = (NSString *)[resObj objectForKey:@"msg"];
            [commonUtils showVAlertSimple:@"Failed" body:msg duration:2.0];
        }
    } else {
        [commonUtils showVAlertSimple:@"Connection Error" body:@"Please check your internet connection status" duration:1.0];
    }
}

- (void)requestOverLogin {
    MySidePanelController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MySidePanelController"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
