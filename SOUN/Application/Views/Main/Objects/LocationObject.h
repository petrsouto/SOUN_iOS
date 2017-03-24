//
//  LocationObject.h
//  SOUN
//
//  Created by Apple Developer on 4/17/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationObject : NSObject {
    NSString *nickname;
    NSString *landmark;
}

@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *landmark;

- (instancetype)initWithNickname:(NSString *)nick_name landmark:(NSString *)land_mark;

@end
