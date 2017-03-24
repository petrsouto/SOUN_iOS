//
//  CompletedOrderObject.h
//  SOUN
//
//  Created by Prince on 4/27/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompletedOrderObject : NSObject

@property (nonatomic, strong) NSString *dateOfMonth;
@property (nonatomic, strong) NSString *jobTitle;
@property (nonatomic, strong) NSString *jobTime;
@property (nonatomic, strong) NSString *jobDate;
@property (nonatomic, strong) NSString *jobLocation;

- (instancetype)initWithDate:(NSString *)dateOnly title:(NSString *)title time:(NSString *)time date:(NSString *)date location:(NSString *)location;

@end
