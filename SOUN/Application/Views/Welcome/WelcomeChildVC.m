//
//  WelcomeChildVC.m
//  SOUN
//
//  Created by Apple Developer on 4/5/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "WelcomeChildVC.h"

@interface WelcomeChildVC ()

@end

@implementation WelcomeChildVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
}

- (void)initUI {
    if (appController.language) {
        [_welcomeLabel setText:@"WELCOME TO"];
        [_appNameLabel setText:@"SOUN APP"];
        [_descriptionLabel setText:@"Your personal home handyman in your pockety"];
    } else {
        [_welcomeLabel setText:@"WELCOME TO"];
        [_appNameLabel setText:@"SOUN APP"];
        [_descriptionLabel setText:@"Your personal home handyman in your pockety"];
    }
}

- (void) viewDidAppear:(BOOL)animated {
    [commonUtils runSpinAnimationOnView:_outImage duration:2.0 repeat:1.0 direction:-1 axis:3];
    [commonUtils runSpinAnimationOnView:_inImage duration:2.0 repeat:1.0 direction:1 axis:3];
    [commonUtils runSpinAnimationOnView:_logoImage duration:2.0 repeat:1.0 direction:1 axis:2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
