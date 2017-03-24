//
//  LocationObject.m
//  SOUN
//
//  Created by Apple Developer on 4/17/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "LocationObject.h"

@implementation LocationObject
@synthesize nickname;
@synthesize landmark;

- (instancetype)initWithNickname:(NSString *)nick_name landmark:(NSString *)land_mark {
    self = [super init];
    if (self) {
        self.nickname = nick_name;
        self.landmark = land_mark;
    }
    
    return self;
}

@end
