//
//  ContactUsVC.h
//  SOUN
//
//  Created by Apple Developer on 4/10/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactUsVC : BaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *contactUsTable;


@end
