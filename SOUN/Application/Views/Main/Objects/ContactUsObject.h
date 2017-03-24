//
//  ContactUsObject.h
//  SOUN
//
//  Created by Prince on 4/27/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactUsObject : NSObject {
    UIImage *contactImage;
    NSString *contactTitle;
}

@property (nonatomic, strong) UIImage *contactImage;
@property (nonatomic, strong) NSString *contactTitle;

- (instancetype)initWithData:(UIImage *)image title:(NSString *)title;

@end
