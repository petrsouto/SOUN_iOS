//
//  HistoryVC.m
//  SOUN
//
//  Created by Apple Developer on 4/10/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "HistoryVC.h"
#import "CompletedOrderCell.h"
#import "CompletedOrderObject.h"

@interface HistoryVC () {
    NSMutableArray *completedOrders;
}

@end

@implementation HistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    completedOrders = [[NSMutableArray alloc] init];
    
    CompletedOrderObject *completedOrder = [[CompletedOrderObject alloc] initWithDate:@"13" title:@"Plumbing job" time:@"Time: 9AM-1PM" date:@"Date: 13 December, 2015" location:@"Location: Home"];
    for (int i = 0; i < 10; i++) {
        [completedOrders addObject:completedOrder];
    }
    
    
    [self initUI];
}

- (void)initUI {
    self.completedOrdersTable.delegate = self;
    self.completedOrdersTable.dataSource = self;
}



#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [completedOrders count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CompletedOrderCell";
    CompletedOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    CompletedOrderObject *completedOrder = [completedOrders objectAtIndex:indexPath.row];
    
    [cell.dateLabel     setText:completedOrder.dateOfMonth];
    [cell.jobTitleLabel setText:completedOrder.jobTitle];
    [cell.timeLabel     setText:completedOrder.jobTime];
    [cell.jobDateLabel  setText:completedOrder.jobDate];
    [cell.locationLabel setText:completedOrder.jobLocation];
    
    [commonUtils setBorder:cell.containerView borderColor:RGBA(117, 117, 117, 1) width:1];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
