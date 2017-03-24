//
//  ServiceStepThirdVC.m
//  SOUN
//
//  Created by Apple Developer on 4/16/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "ServiceStepThirdVC.h"
#import "DateCollectionViewCell.h"
#import "LocationObject.h"
#import "BookedLocationCell.h"

@interface ServiceStepThirdVC ()

@end

@implementation ServiceStepThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDate *currentDate = [NSDate date];
    
    _date = [[NSMutableDictionary alloc] init];
    _arrDate = [[NSMutableArray alloc] init];
    
    NSDate *date = currentDate;
    
    for (int i=0;i<50;i++) {
        NSString *day = [commonUtils getDay:date];
        NSString *dayOfWeek = [commonUtils getDayOfWeek:date];
        NSString *month = [commonUtils getMonth:date];
        self.date = [NSMutableDictionary dictionaryWithDictionary:@{@"day" : day,
                                                                    @"dayOfWeek" : dayOfWeek,
                                                                    @"month" : month}];
        [self.arrDate addObject:self.date];
        date = [commonUtils getNextDate:date];
    }

    appController.bookedLocations = [[NSMutableArray alloc] init];
    LocationObject *location = [[LocationObject alloc] initWithNickname:@"empty" landmark:@"empty"];
    [appController.bookedLocations addObject:location];
    
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated {
    [_locationTable reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView {
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    _locationTable.dataSource = self;
    _locationTable.delegate = self;
    
    [_titleLabel setText:[appController.serviceTitles[appController.currentService] uppercaseString]];
    [_serviceImage setImage:[UIImage imageNamed:appController.serviceImages[appController.currentService]]];
    
    CGSize shadowOffset = CGSizeMake(0, 0);
    
    [commonUtils setShadowView:self.shadowView color:[UIColor darkGrayColor] offset:shadowOffset radius:5.0 opacity:0.8];
    
    [commonUtils setRoundedAndShadowView:self.stepOneView cornerRadius:self.stepOneView.frame.size.height/2 shadowColor:[UIColor darkGrayColor] shadowOffset:shadowOffset shadowRadius:5.0 shadowOpacity:0.8];
    [commonUtils setRoundedAndShadowView:self.stepTwoView cornerRadius:self.stepTwoView.frame.size.height/2 shadowColor:[UIColor darkGrayColor] shadowOffset:shadowOffset shadowRadius:5.0 shadowOpacity:0.8];
    [commonUtils setRoundedAndShadowView:self.stepThreeView cornerRadius:self.stepThreeView.frame.size.height/2 shadowColor:[UIColor darkGrayColor] shadowOffset:shadowOffset shadowRadius:5.0 shadowOpacity:0.8];
    
    [_selectTimeSegment setTitleTextAttributes:@{
                                                 NSFontAttributeName:[UIFont fontWithName:@"Helvetica Neue" size:15.0],
                                                 NSForegroundColorAttributeName:RGBA(72, 131, 186, 1)}
                                      forState:UIControlStateNormal];
    [_selectTimeSegment setTintColor:RGBA(30, 40, 76, 1)];
    
    
    _scrollView.contentSize = CGSizeMake(_contentView.frame.size.width, _contentView.frame.size.height);
    
    [commonUtils setRoundedView:_nextView radius:_nextView.frame.size.height/2];
    
}

#pragma mark - CollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.arrDate count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//cell content setting
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *dateCellIdentifier = @"DateCollectionViewCell";
    
    DateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:dateCellIdentifier forIndexPath:indexPath];
    
    NSDictionary *date = [_arrDate objectAtIndex:indexPath.row];
    NSString *day = date[@"day"];
    NSString *dayOfWeek = date[@"dayOfWeek"];
    NSString *month = date[@"month"];
    
    [commonUtils setRoundedView:cell.viewContainer radius:10.0];
    
    if ([indexPath isEqual:_selectedIndexPath]) {
        [cell.checkImage setHidden:NO];
    } else {
        [cell.checkImage setHidden:YES];
    }
    [cell.lblDate setText:[NSString stringWithFormat:@"%@ %@", day, month]];
    [cell.lblDayOfWeek setText:dayOfWeek];
    
    if (indexPath == self.selectedIndexPath) {
    }
    
    return cell;
}

//select cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    [self.collectionView reloadData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(_collectionView.frame.size.height/1.25, _collectionView.frame.size.height);
}


#pragma mark - TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return appController.bookedLocations.count;
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
    return appController.bookedLocations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"BookedLocationCell";
    BookedLocationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    if (indexPath.section == (appController.bookedLocations.count - 1)) {
        [cell.nickNameLabel setHidden:YES];
        [cell.landmarkLabel setHidden:YES];
        [cell.addLabel setHidden:NO];
        [cell.editButton setHidden:YES];
        [cell.deleteButton setHidden:YES];
        [cell.actionImage setImage:[UIImage imageNamed:@"ic_add.png"]];
    } else {
        LocationObject *location = [appController.bookedLocations objectAtIndex:indexPath.section];
        
        
        [cell.nickNameLabel setHidden:NO];
        [cell.landmarkLabel setHidden:NO];
        [cell.addLabel setHidden:YES];
        [cell.editButton setHidden:NO];
        [cell.deleteButton setHidden:NO];
        [cell.actionImage setImage:[UIImage imageNamed:@"ic_check.png"]];
        
        [cell.nickNameLabel setText:location.nickname];
        [cell.landmarkLabel setText:location.landmark];
        
        cell.deleteButton.tag = indexPath.row;
        [cell.deleteButton addTarget:self action:@selector(deleteButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == (appController.bookedLocations.count - 1)) {
        AddNewLocationVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddNewLocationVC"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

#pragma mark - Seletors
- (void)deleteButtonClicked:(UIButton *)sender {
    [appController.bookedLocations removeObjectAtIndex:sender.tag];
    [_locationTable reloadData];
}


- (IBAction)submit:(id)sender {
    OrderReviewVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OrderReviewVC"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
