//
//  ServiceStepFirstVC.h
//  SOUN
//
//  Created by Apple Developer on 4/11/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceStepFirstVC : BaseViewController<UITextViewDelegate>


@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UIView *navigationBarView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (strong, nonatomic) IBOutlet UIView *shadowView;

@property (strong, nonatomic) IBOutlet UIImageView *serviceImage;

@property (strong, nonatomic) IBOutlet UIView *stepOneView;
@property (strong, nonatomic) IBOutlet UIView *stepTwoView;
@property (strong, nonatomic) IBOutlet UIView *stepThreeView;

@property (strong, nonatomic) IBOutlet UIView *requirementsSuperView;
@property (strong, nonatomic) IBOutlet UIView *requirementsView;
@property (strong, nonatomic) IBOutlet UITextView *requirementsTextView;

@property (strong, nonatomic) IBOutlet UIImageView *cornerImage;

@property (strong, nonatomic) IBOutlet UIView *nextView;

- (IBAction)next:(id)sender;
@end
