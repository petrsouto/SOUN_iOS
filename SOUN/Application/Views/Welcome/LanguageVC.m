//
//  LanguageVC.m
//  SOUN
//
//  Created by Apple Developer on 3/31/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "LanguageVC.h"

@interface LanguageVC ()

@end

@implementation LanguageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
}

- (void)initUI {
    [commonUtils setRoundedView:_arabicButton radius:_arabicButton.frame.size.height/2];
    [commonUtils setRoundedView:_englishButton radius:_englishButton.frame.size.height/2];
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

- (IBAction)selectLanguage:(UIButton *)sender {
    if (sender.tag == 0) {
        appController.language = false;
    } else {
        appController.language = true;
    }
    
    WelcomeRootVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"WelcomeRootVC"];
    
    [UIView transitionWithView:self.navigationController.view
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        [self.navigationController pushViewController:vc animated:NO];
                    }
                    completion:nil];
}

@end
