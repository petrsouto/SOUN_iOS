//
//  WelcomeChildVC.h
//  SOUN
//
//  Created by Apple Developer on 4/5/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeChildVC : UIViewController

@property (assign, nonatomic) NSInteger index;

@property (strong, nonatomic) IBOutlet UIImageView *outImage;
@property (strong, nonatomic) IBOutlet UIImageView *inImage;
@property (strong, nonatomic) IBOutlet UIImageView *logoImage;

@property (strong, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (strong, nonatomic) IBOutlet UILabel *appNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;


@end
