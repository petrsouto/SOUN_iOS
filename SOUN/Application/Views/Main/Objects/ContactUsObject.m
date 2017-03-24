//
//  ContactUsObject.m
//  SOUN
//
//  Created by Prince on 4/27/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "ContactUsObject.h"

@implementation ContactUsObject

@synthesize contactImage;
@synthesize contactTitle;

- (instancetype)initWithData:(UIImage *)image title:(NSString *)title {
    self = [super init];
    if (self) {
        self.contactImage = image;
        self.contactTitle = title;
    }
    
    return self;
}


@end
