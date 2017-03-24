//  AppController.h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppController : NSObject

@property (nonatomic, strong) NSMutableDictionary *currentUser;


@property (nonatomic, strong) DoAlertView *vAlert;


@property (nonatomic, strong) NSMutableArray *services;
@property (nonatomic, strong) NSArray *serviceImages, *serviceTitles;

@property (nonatomic, strong) NSMutableArray *contacts;
@property (nonatomic, strong) NSArray *contactImages, *contactTitles;

@property (nonatomic, strong) UIColor *appMainColor, *appTextColor, *appThirdColor;




// Temporary Variables
@property BOOL language;

@property NSInteger currentService;
@property (nonatomic, strong) NSString *requirements;
@property (nonatomic, strong) NSData *bookedDate;
@property (nonatomic, strong) NSMutableArray *bookedLocations;


+ (AppController *)sharedInstance;

@end