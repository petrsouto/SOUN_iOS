//
//  CommonUtils.m
//


#import "CommonUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation CommonUtils

+ (instancetype)shared {
    static id instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

//User
- (void)setUserDefaultDic:(NSString *)key withDic:(NSMutableDictionary *)dic {
    NSString *newKey = @"";
    for(NSString *dicKey in [dic allKeys]) {
        newKey = [[key stringByAppendingString:@"_"] stringByAppendingString:dicKey];
        [self setUserDefault:newKey withFormat:[dic objectForKey:dicKey]];
    }
}

- (void)setUserDefault:(NSString *)key withFormat:(id)val {
    if([val isKindOfClass:[NSString class]] && [val isEqualToString:@""])
        val = @"0";
    if ([val isKindOfClass:[NSNull class]])
        val = @"0";
    [[NSUserDefaults standardUserDefaults] setObject:val forKey:key];
}

- (id)getUserDefault:(NSString *)key {
    id val = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if([val isKindOfClass:[NSString class]] && (val == nil || val == NULL || [val isEqualToString:@"0"])) val = nil;
    return val;
}

- (NSMutableDictionary *)getUserDefaultDicByKey:(NSString *)key {
    NSMutableDictionary *dicAll = (NSMutableDictionary *)[[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    for(NSString *dicKey in [dicAll allKeys]) {
        if([dicKey rangeOfString:[key stringByAppendingString:@"_"]].location != NSNotFound) {
            [dic setObject:[dicAll objectForKey:dicKey] forKey:[dicKey substringFromIndex:[[key stringByAppendingString:@"_"] length]]];
        }
    }
    return dic;
}

- (void)removeUserDefault:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}


//    Set Rounded View
- (void)setRoundedView:(UIView *)view radius:(CGFloat)radius {
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = radius;
}

//    Set Shadow View
- (void)setShadowView:(UIView *)view color:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius opacity:(CGFloat)opacity {
    CALayer *layer = view.layer;
    layer.shadowOffset = offset;
    layer.shadowColor = color.CGColor;
    layer.shadowRadius = radius;
    layer.shadowOpacity = opacity;
}

//    set Rounded and Shadow View
- (void)setRoundedAndShadowView:(UIView *)view cornerRadius:(CGFloat)cornerRadius shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowRadius:(CGFloat)shadowRadius shadowOpacity:(CGFloat)shadowOpacity {
    
    CALayer *layer = view.layer;

    [layer setCornerRadius:cornerRadius];
    
    [layer setShadowColor:shadowColor.CGColor];
    [layer setShadowOpacity:shadowOpacity];
    [layer setShadowRadius:shadowRadius];
    [layer setShadowOffset:shadowOffset];
}

- (void)setRoundedOneSideView:(UIView *)view whichSide:(int)index cornerRadii:(CGSize)cornerRadii{
    UIBezierPath *maskPath;
    
    switch (index) {
        case 1:
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:(UIRectCornerTopLeft) cornerRadii:cornerRadii];
            break;
        case 2:
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:(UIRectCornerTopRight) cornerRadii:cornerRadii];
            break;
        case 3:
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:(UIRectCornerBottomRight) cornerRadii:cornerRadii];
            break;
        case 4:
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:(UIRectCornerBottomLeft) cornerRadii:cornerRadii];
            break;
        default:
            break;
    }
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path  = maskPath.CGPath;
    view.layer.mask = maskLayer;
}

- (void)setBorder:(UIView *)view borderColor:(UIColor *)borderColor width:(CGFloat)borderWidth {
    view.layer.borderColor = borderColor.CGColor;
    view.layer.borderWidth = borderWidth;
}


//  Animation Rotate
- (void)runSpinAnimationOnView:(UIView *)view duration:(CGFloat)duration repeat:(float)repeat direction:(int)direction axis:(int)axis {
    
    CABasicAnimation *rotationAnimation;
    
    switch (axis) {
        case 1:
            rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
            break;
        case 2:
            rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
            break;
        case 3:
            rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            break;            
        default:
            break;
    }
    
    rotationAnimation.toValue = [NSNumber numberWithFloat:direction * 2.0 * M_PI];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}


//Date
- (NSString *)getDay:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    
    return [NSString stringWithFormat:@"%ld",(long)[components day]];
}

- (NSString *)getDayOfWeek:(NSDate *)date {
    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE"];
    //    NSString *dayOfWeek = [[dateFormatter stringFromDate:date] uppercaseString];
    
    return [[dateFormatter stringFromDate:date] uppercaseString];
}

- (NSString *)getMonth:(NSDate *)date {
    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM"];
    return [[dateFormatter stringFromDate:date] uppercaseString];
}

- (NSDate *)getNextDate:(NSDate *)date {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:1];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *nextDate = [calendar dateByAddingComponents:components toDate:date options:0];
    
    return nextDate;
}

//Alert
- (void)showAlert:(NSString *)title withMessage:(NSString *)message withViewController:(UIViewController *)vc{
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:title
                                message:message
                                preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:nil];
    [alert addAction:ok];
    
    [vc presentViewController:alert animated:YES completion:nil];
}

- (void)showVAlertSimple:(NSString *)title body:(NSString *)body duration:(float)duration {
    _dicAlertContent = [[NSMutableDictionary alloc] init];
    [_dicAlertContent setObject:title forKey:@"title"];
    [_dicAlertContent setObject:body forKey:@"body"];
    [_dicAlertContent setObject:[NSString stringWithFormat:@"%f", duration] forKey:@"duration"];
    
    [self performSelector:@selector(vAlertSimpleThread) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
}
-(void)vAlertSimpleThread{
    appController.vAlert = [[DoAlertView alloc] init];
    appController.vAlert.nAnimationType = 2;  // there are 5 type of animation
    appController.vAlert.dRound = 7.0;
    appController.vAlert.bDestructive = NO;
    
    
    [appController.vAlert doAlert:[_dicAlertContent objectForKey:@"title"] body:[_dicAlertContent objectForKey:@"body"] duration:[[_dicAlertContent objectForKey:@"duration"] floatValue] done:^(DoAlertView *alertView) {}];
}

//Check
- (BOOL) isFormEmpty:(NSMutableArray *)array {
    BOOL isEmpty = NO;
    for(NSString *str in array) {
        if([str isEqualToString:@""] || [str isEqualToString:@"0"]) {
            isEmpty = YES;
            break;
        }
    }
    return isEmpty;
}

//ActivityIndicator
- (void)showActivityIndicatorColored:(UIView *)inView {
    if (activityIndicator) {
        [self hideActivityIndicator];
    }
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [activityIndicator setHidden:NO];
    activityIndicator.center = inView.center;
    activityIndicator.color = appController.appMainColor;
    [activityIndicator startAnimating];
    [activityIndicator.layer setZPosition:999];
    [inView addSubview:activityIndicator];
    //    [inView setUserInteractionEnabled:NO];
}

- (void)hideActivityIndicator {
    [activityIndicator setHidden:YES];
    [activityIndicator removeFromSuperview];
    activityIndicator = nil;
}

#pragma mark - Common Httl Request Methods
- (id) httpJsonRequest:(NSString *) urlStr withJSON:(NSMutableDictionary *)params {
    NSString *response = [self getJsonResponse:urlStr withJSON:params];
    
    return [[SBJsonParser new] objectWithString:response];
}

- (nullable NSString *)getJsonResponse:(NSString *)urlStr withJSON:(NSMutableDictionary *)params {
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    __block NSString *responseStr = nil;
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSString *body = [[SBJsonWriter new] stringWithObject:params];
    NSData *requestData = [body dataUsingEncoding:NSASCIIStringEncoding];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue:API_KEY forHTTPHeaderField:@"api-key"];
    [request setHTTPBody: requestData];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil) {
            NSString *jsonResult = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            NSLog(@"%@", jsonResult);
            
            responseStr = jsonResult;
        }
        
        dispatch_semaphore_signal(semaphore);
    }] resume];
    
    
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int64_t)(60000 * NSEC_PER_MSEC)));
    
    return responseStr;
}

@end
