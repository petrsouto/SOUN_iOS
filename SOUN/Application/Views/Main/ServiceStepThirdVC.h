//
//  ServiceStepThirdVC.h
//  SOUN
//
//  Created by Apple Developer on 4/16/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceStepThirdVC : BaseViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate>

@property NSMutableDictionary *date;
@property NSMutableArray *arrDate;
@property NSIndexPath *selectedIndexPath;



@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (strong, nonatomic) IBOutlet UIView *shadowView;
@property (strong, nonatomic) IBOutlet UIImageView *serviceImage;

@property (strong, nonatomic) IBOutlet UIView *stepOneView;
@property (strong, nonatomic) IBOutlet UIView *stepTwoView;
@property (strong, nonatomic) IBOutlet UIView *stepThreeView;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) IBOutlet UISegmentedControl *selectTimeSegment;
@property (strong, nonatomic) IBOutlet UITableView *locationTable;

@property (strong, nonatomic) IBOutlet UIView *nextView;



- (IBAction)submit:(id)sender;

@end
