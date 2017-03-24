//
//  CompletedOrderObject.m
//  SOUN
//
//  Created by Prince on 4/27/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "CompletedOrderObject.h"

@implementation CompletedOrderObject

@synthesize dateOfMonth;
@synthesize jobTitle;
@synthesize jobTime;
@synthesize jobDate;
@synthesize jobLocation;

- (instancetype)initWithDate:(NSString *)dateOnly title:(NSString *)title time:(NSString *)time date:(NSString *)date location:(NSString *)location {
    self = [super init];
    if (self) {
        self.dateOfMonth = dateOnly;
        self.jobTitle = title;
        self.jobTime = time;
        self.jobDate = date;
        self.jobLocation = location;
    }
    
    return self;
}

@end
