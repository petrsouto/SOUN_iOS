//
//  ServiceStepSecondVC.m
//  SOUN
//
//  Created by Apple Developer on 4/11/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "ServiceStepSecondVC.h"

@interface ServiceStepSecondVC ()

@end

@implementation ServiceStepSecondVC

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
    
    [_titleLabel setText:[appController.serviceTitles[appController.currentService] uppercaseString]];
    [_serviceImage setImage:[UIImage imageNamed:appController.serviceImages[appController.currentService]]];
    
    CGSize shadowOffset = CGSizeMake(0, 0);

    [commonUtils setShadowView:self.shadowView color:[UIColor darkGrayColor] offset:shadowOffset radius:5.0 opacity:0.8];
    
    [commonUtils setRoundedAndShadowView:self.stepOneView cornerRadius:self.stepOneView.frame.size.height/2 shadowColor:[UIColor darkGrayColor] shadowOffset:shadowOffset shadowRadius:5.0 shadowOpacity:0.8];
    [commonUtils setRoundedAndShadowView:self.stepTwoView cornerRadius:self.stepTwoView.frame.size.height/2 shadowColor:[UIColor darkGrayColor] shadowOffset:shadowOffset shadowRadius:5.0 shadowOpacity:0.8];
    [commonUtils setRoundedAndShadowView:self.stepThreeView cornerRadius:self.stepThreeView.frame.size.height/2 shadowColor:[UIColor darkGrayColor] shadowOffset:shadowOffset shadowRadius:5.0 shadowOpacity:0.8];
    
    
    shadowOffset = CGSizeMake(3, 3);

    _scrollView.contentSize = CGSizeMake(_contentView.frame.size.width, _contentView.frame.size.height);
    
    [commonUtils setRoundedView:_nextView radius:_nextView.frame.size.height/2];
    
}

@end
