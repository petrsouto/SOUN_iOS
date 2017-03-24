//
//  DateCollectionViewCell.h
//  Soon
//
//  Created by Apple Developer on 3/18/16.
//  Copyright © 2016 Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UILabel *lblDayOfWeek;
@property (strong, nonatomic) IBOutlet UIView *viewContainer;
@property (strong, nonatomic) IBOutlet UIImageView *checkImage;

@end
