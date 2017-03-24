//
//  ServiceObject.h
//  SOUN
//
//  Created by Apple Developer on 4/10/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceObject : NSObject {
    UIImage *serviceImage;
    NSString *serviceTitle;
}

@property (nonatomic, strong) UIImage *serviceImage;
@property (nonatomic, strong) NSString *serviceTitle;

- (instancetype)initWithData:(UIImage *)image title:(NSString *)title;
@end
