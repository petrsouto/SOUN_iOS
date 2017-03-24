//
//  BookedLocationCell.h
//  SOUN
//
//  Created by Apple Developer on 4/17/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookedLocationCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *actionImage;
@property (strong, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *addLabel;
@property (strong, nonatomic) IBOutlet UILabel *landmarkLabel;
@property (strong, nonatomic) IBOutlet UIButton *editButton;
@property (strong, nonatomic) IBOutlet UIButton *deleteButton;

@end
