//
//  ContactUsVC.m
//  SOUN
//
//  Created by Apple Developer on 4/10/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "ContactUsVC.h"
#import "ContactUsObject.h"
#import "ContactUsCell.h"

@interface ContactUsVC ()

@end

@implementation ContactUsVC

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
    self.contactUsTable.delegate = self;
    self.contactUsTable.dataSource = self;
}



#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [appController.contacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ContactUsCell";
    ContactUsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.iconImage.image = [UIImage imageNamed:appController.contactImages[indexPath.row]];
    [cell.titleLabel setText:appController.contactTitles[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    appController.currentService = indexPath.row;
//    
//    
//    ServiceStepFirstVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ServiceStepFirstVC"];
//    
//    [self.navigationController pushViewController:vc animated:YES];
}




@end
