//
//  OrderReviewVC.h
//  SOUN
//
//  Created by Apple Developer on 4/17/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderReviewVC : BaseViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIView *jobView;
@property (strong, nonatomic) IBOutlet UIView *dateView;
@property (strong, nonatomic) IBOutlet UIView *timeView;
@property (strong, nonatomic) IBOutlet UIView *locationView;

@property (strong, nonatomic) IBOutlet UILabel *jobLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;

@property (strong, nonatomic) IBOutlet UIButton *okButton;

- (IBAction)ok:(id)sender;
@end
