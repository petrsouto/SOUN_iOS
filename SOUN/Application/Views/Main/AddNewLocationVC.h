//
//  AddNewLocationVC.h
//  SOUN
//
//  Created by Apple Developer on 4/17/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewLocationVC : BaseViewController<UITextFieldDelegate, MKMapViewDelegate>

@property NSMutableDictionary *date;
@property NSMutableArray *arrDate;
@property NSIndexPath *selectedIndexPath;



@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UIView *navigationBarView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIView *shadowView;
@property (strong, nonatomic) IBOutlet UIImageView *serviceImage;

@property (strong, nonatomic) UITextField *currentTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *landmarkTextField;

@property (strong, nonatomic) IBOutlet UIView *nextView;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)done:(id)sender;
@end
