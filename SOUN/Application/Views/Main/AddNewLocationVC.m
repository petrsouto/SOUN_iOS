//
//  AddNewLocationVC.m
//  SOUN
//
//  Created by Apple Developer on 4/17/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "AddNewLocationVC.h"
#import "LocationObject.h"

@interface AddNewLocationVC ()

@end

@implementation AddNewLocationVC

@synthesize nicknameTextField, landmarkTextField, mapView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    nicknameTextField.delegate = self;
    landmarkTextField.delegate = self;
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    mapView.centerCoordinate = mapView.userLocation.coordinate;
    
    [self initView];
}

- (void)initView {
    //  Hide keyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    //  Move up Screen
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    [_titleLabel setText:[appController.serviceTitles[appController.currentService] uppercaseString]];
    [_serviceImage setImage:[UIImage imageNamed:appController.serviceImages[appController.currentService]]];
    
    CGSize shadowOffset = CGSizeMake(0, 0);
    
    [commonUtils setShadowView:self.shadowView color:[UIColor darkGrayColor] offset:shadowOffset radius:5.0 opacity:0.8];
    
    [commonUtils setBorder:nicknameTextField borderColor:[UIColor lightGrayColor] width:1.0];
    [commonUtils setBorder:landmarkTextField borderColor:[UIColor lightGrayColor] width:
     1.0];
    
    [commonUtils setRoundedView:_nextView radius:_nextView.frame.size.height/2];
    
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
    CGFloat contentViewOffset = _contentView.frame.origin.y - _navigationBarView.frame.size.height;
    CGFloat contentViewHeight = _contentView.frame.size.height;
    
    CGFloat movementDistance = contentViewHeight - (contentViewOffset + textFieldY + textFieldHeight + keyboardHeight + 10);
    
    if (movementDistance > 0)
        return;
    
    _contentView.frame = CGRectOffset(_contentView.frame, 0, movementDistance);
}

- (void)keyboardWillHide:(NSNotification *)notification {
    _contentView.frame = CGRectMake(0, _navigationBarView.frame.size.height, _contentView.frame.size.width, _contentView.frame.size.height);
}

#pragma mark - TextField Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.currentTextField = textField;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == nicknameTextField) {
        [landmarkTextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (IBAction)done:(id)sender {
    NSString *nickname = [nicknameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *landmark = [landmarkTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([nickname length]==0) {
        [commonUtils showVAlertSimple:@"Waring" body:@"Please enter the nickname" duration:1.0];
        return;
    }
    
    if ([landmark length]==0) {
        [commonUtils showVAlertSimple:@"Waring" body:@"Please enter the landmark" duration:1.0];
        return;
    }
    
    LocationObject *location = [[LocationObject alloc] initWithNickname:nickname landmark:landmark];
    [appController.bookedLocations insertObject:location atIndex:(appController.bookedLocations.count-1)];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Map View Delegate
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 500, 500);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];}
@end
