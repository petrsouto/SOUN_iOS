//
//  ServicesVC.m
//  SOUN
//
//  Created by Apple Developer on 4/10/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "ServicesVC.h"
#import "ServiceObject.h"
#import "ServiceCell.h"

@interface ServicesVC ()

@end

@implementation ServicesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initUI {
    self.serviceTable.delegate = self;
    self.serviceTable.dataSource = self;

    self.title = @"Services";
}



#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [appController.services count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ServiceCell";
    ServiceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.serviceImageView.image = [UIImage imageNamed:appController.serviceImages[indexPath.row]];
    [cell.serviceLabel setText:appController.serviceTitles[indexPath.row]];
    
    if (indexPath.row == 0) {
        cell.topBarView.hidden = YES;
    } else if (indexPath.row == (appController.services.count - 1)) {
        cell.bottomeBarView.hidden = YES;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    appController.currentService = indexPath.row;
    
    
    ServiceStepFirstVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ServiceStepFirstVC"];
    
    [self.navigationController pushViewController:vc animated:YES];
}



@end
