//
//  ServiceStepFirstVC.m
//  SOUN
//
//  Created by Apple Developer on 4/11/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "ServiceStepFirstVC.h"

@interface ServiceStepFirstVC () {
    BOOL isPlaceHolder;
}

@end

@implementation ServiceStepFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView {
    
    _requirementsTextView.delegate = self;

    [_titleLabel setText:[appController.serviceTitles[appController.currentService] uppercaseString]];
    
    [_serviceImage setImage:[UIImage imageNamed:appController.serviceImages[appController.currentService]]];
    [commonUtils setShadowView:self.shadowView color:[UIColor darkGrayColor] offset:CGSizeMake(0, 0) radius:5.0 opacity:0.8];
    
    [commonUtils setRoundedAndShadowView:self.stepOneView cornerRadius:self.stepOneView.frame.size.height/2 shadowColor:[UIColor darkGrayColor] shadowOffset:CGSizeMake(0, 0) shadowRadius:5.0 shadowOpacity:0.8];
    [commonUtils setRoundedAndShadowView:self.stepTwoView cornerRadius:self.stepTwoView.frame.size.height/2 shadowColor:[UIColor darkGrayColor] shadowOffset:CGSizeMake(0, 0) shadowRadius:5.0 shadowOpacity:0.8];
    [commonUtils setRoundedAndShadowView:self.stepThreeView cornerRadius:self.stepThreeView.frame.size.height/2 shadowColor:[UIColor darkGrayColor] shadowOffset:CGSizeMake(0, 0) shadowRadius:5.0 shadowOpacity:0.8];
    
    [commonUtils setRoundedAndShadowView:_requirementsView cornerRadius:5.0 shadowColor:[UIColor darkGrayColor] shadowOffset:CGSizeMake(0, 0) shadowRadius:5.0 shadowOpacity:0.8];
    [commonUtils setRoundedOneSideView:_cornerImage whichSide:3 cornerRadii:CGSizeMake(5.0, 5.0)];
    
    
    _requirementsTextView.text = @"EX:plumbing problem and normal homes have two separate plumbing systems";
    _requirementsTextView.textColor = [UIColor lightGrayColor];
    isPlaceHolder = true;
    
    [self drawRuledLineToTextView];
    
    
    [commonUtils setRoundedView:_nextView radius:_nextView.frame.size.height/2];
    
    //  Hide keyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    //  Move up Screen
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

//    Hide Keyboard
- (void)dismissKeyboard {
    [_requirementsTextView resignFirstResponder];
}

#pragma mark - UITextView Delegate
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView {
    if(isPlaceHolder) {
        _requirementsTextView.text = @"";
        _requirementsTextView.textColor = [UIColor blackColor];
        isPlaceHolder = false;
    }
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView {
    if(_requirementsTextView.text.length == 0){
        _requirementsTextView.textColor = [UIColor lightGrayColor];
        _requirementsTextView.text = @"EX:plumbing problem and normal homes have two separate plumbing systems";
        [_requirementsTextView resignFirstResponder];
        isPlaceHolder = true;
    }
}


#pragma mark - Move up Screen
- (void)keyboardWillShow:(NSNotification *)notification {
    CGFloat keyboardHeight = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
    
    CGFloat superViewY = _requirementsSuperView.frame.origin.y;
    CGFloat subViewY = _requirementsView.frame.origin.y;
    CGFloat textViewY = _requirementsTextView.frame.origin.y;
    CGFloat textViewHeight = _requirementsTextView.frame.size.height;
    
    CGFloat contentViewHeight = _contentView.frame.size.height;
    
    CGFloat movementDistance = contentViewHeight - (superViewY + subViewY + textViewY + textViewHeight + keyboardHeight +  10);
    
    if (movementDistance > 0)
        return;
    
    _contentView.frame = CGRectOffset(_contentView.frame, 0, movementDistance);
}

- (void)keyboardWillHide:(NSNotification *)notification {
    _contentView.frame = CGRectMake(0, _navigationBarView.frame.size.height, _contentView.frame.size.width, _contentView.frame.size.height);
}


- (void)drawRuledLineToTextView {
    NSUInteger numberOfLines = _requirementsTextView.frame.size.height/_requirementsTextView.font.lineHeight;
    
    for (int x = 1; x < 5 * numberOfLines; x++) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(4, _requirementsTextView.font.lineHeight * x + 8, _requirementsTextView.contentSize.width - 4, 1)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [_requirementsTextView addSubview:lineView];
    }
}


- (IBAction)next:(id)sender {
    appController.requirements = [_requirementsTextView.text stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]];
    
    ServiceStepSecondVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ServiceStepSecondVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
