//
//  LanguageVC.h
//  SOUN
//
//  Created by Apple Developer on 3/31/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LanguageVC : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *outImage;
@property (strong, nonatomic) IBOutlet UIImageView *inImage;
@property (strong, nonatomic) IBOutlet UIImageView *logoImage;

@property (strong, nonatomic) IBOutlet UILabel *arabicLabel;
@property (strong, nonatomic) IBOutlet UILabel *englishLabel;


@property (strong, nonatomic) IBOutlet UIButton *arabicButton;
@property (strong, nonatomic) IBOutlet UIButton *englishButton;

- (IBAction)selectLanguage:(UIButton *)sender;

@end
