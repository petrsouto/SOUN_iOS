//
//  HistoryVC.h
//  SOUN
//
//  Created by Apple Developer on 4/10/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryVC : BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *completedOrdersTable;


@end
