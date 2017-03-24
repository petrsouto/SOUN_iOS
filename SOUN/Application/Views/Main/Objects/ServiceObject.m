//
//  ServiceObject.m
//  SOUN
//
//  Created by Apple Developer on 4/10/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "ServiceObject.h"

@implementation ServiceObject

@synthesize serviceImage;
@synthesize serviceTitle;

- (instancetype)initWithData:(UIImage *)image title:(NSString *)title {
    self = [super init];
    if (self) {
        self.serviceImage = image;
        self.serviceTitle = title;
    }
    
    return self;
}

@end
