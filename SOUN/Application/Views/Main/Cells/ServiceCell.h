//
//  ServiceCell.h
//  SOUN
//
//  Created by Apple Developer on 4/10/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *serviceImageView;
@property (strong, nonatomic) IBOutlet UILabel *serviceLabel;
@property (strong, nonatomic) IBOutlet UIView *topBarView;
@property (strong, nonatomic) IBOutlet UIView *bottomeBarView;
@end
