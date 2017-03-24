//
//  AppController.m


#import "AppController.h"
#import "ServiceObject.h"
#import "ContactUsObject.h"

static AppController *_appController;

@implementation AppController

+ (AppController *)sharedInstance {
    static dispatch_once_t predicate;
    if (_appController == nil) {
        dispatch_once(&predicate, ^{
            _appController = [[AppController alloc] init];
        });
    }
    return _appController;
}

- (id)init {
    self = [super init];
    if (self) {
        
//        Service Table Data
        _serviceImages = @[@"img_plumbing.png", @"img_electricity.png", @"img_cleaning.png", @"img_air_conditioning.png"];
        _serviceTitles = @[@"Plumbing", @"Electricity", @"Cleaning", @"Air Conditioning"];
        
        _services = [[NSMutableArray alloc] init];
        for (int i = 0; i < _serviceImages.count; i++) {
            ServiceObject *service = [[ServiceObject alloc] initWithData:_serviceImages[i] title:_serviceTitles[i]];
            [_services addObject:service];
        }
        
//        Contact Us Table Data
        _contactImages = @[@"ic_call.png", @"ic_email_us.png", @"ic_twitter.png", @"ic_instagram.png", @"ic_facebook.png"];
        _contactTitles = @[@"Call us", @"E-mail us", @"Follow us on Twitter", @"Follow us on Instagram", @"Like us on Facebook"];
        
        _contacts = [[NSMutableArray alloc] init];
        for (int i = 0; i < _contactImages.count; i++) {
            ContactUsObject *contact = [[ContactUsObject alloc] initWithData:_contactImages[i] title:_contactTitles[i]];
            [_contacts addObject:contact];
        }
        
        _appMainColor = RGBA(16, 58, 96, 1.0f);
        _appTextColor = RGBA(41, 43, 48, 1.0f);
        _appThirdColor = RGBA(61, 155, 196, 1.0f);
        
        
        _requirements = @"";
        _bookedLocations = [[NSMutableArray alloc] init];
        
        _language = true;
        _currentService = 0;
        
        _vAlert = [[DoAlertView alloc] init];
        _vAlert.nAnimationType = 2;  // there are 5 type of animation
        _vAlert.dRound = 7.0;
        _vAlert.bDestructive = NO;  // for destructive mode
        
        _currentUser = [[NSMutableDictionary alloc] init];        
    }

    return self;
}


#pragma mark - Set Base Data
- (void)initBaseData {
}

@end
