//
//  OrderReviewVC.m
//  SOUN
//
//  Created by Apple Developer on 4/17/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "OrderReviewVC.h"

@interface OrderReviewVC ()

@end

@implementation OrderReviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)initUI {

//    Rounded View
    [commonUtils setRoundedView:_jobView radius:_jobView.frame.size.height/10];
    [commonUtils setRoundedView:_dateView radius:_dateView.frame.size.height/10];
    [commonUtils setRoundedView:_timeView radius:_timeView.frame.size.height/10];
    [commonUtils setRoundedView:_locationView radius:_locationView.frame.size.height/10];
    [commonUtils setRoundedView:_okButton radius:_okButton.frame.size.height/2];
}

- (IBAction)ok:(id)sender {
}
@end
