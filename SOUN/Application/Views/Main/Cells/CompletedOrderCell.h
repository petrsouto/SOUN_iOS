//
//  CompletedOrderCell.h
//  SOUN
//
//  Created by Prince on 4/27/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompletedOrderCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@end
