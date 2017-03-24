//  CommonUtils.h
//  Created by BE

#import <Foundation/Foundation.h>

@interface CommonUtils : NSObject{
    UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic, strong) NSMutableDictionary *dicAlertContent;

+ (instancetype)shared;

//User
- (void)setUserDefaultDic:(NSString *)key withDic:(NSMutableDictionary *)dic;
- (void)setUserDefault:(NSString *)key withFormat:(id)val;
- (id)getUserDefault:(NSString *)key;
- (NSMutableDictionary *)getUserDefaultDicByKey:(NSString *)key;
- (void)removeUserDefault:(NSString *)key;

//  Rounded View
- (void)setRoundedView:(UIView *)view radius:(CGFloat)radius;

//    Set Shadow
- (void)setShadowView:(UIView *)view color:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius opacity:(CGFloat)opacity;

//    Set Rounded and Shadow View
- (void)setRoundedAndShadowView:(UIView *)view cornerRadius:(CGFloat)cornerRadius shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowRadius:(CGFloat)shadowRadius shadowOpacity:(CGFloat)shadowOpacity;

//    Set Rounded One Side View
- (void)setRoundedOneSideView:(UIView *)view whichSide:(int)index cornerRadii:(CGSize)cornerRadii;

//    Set Border
- (void)setBorder:(UIView *)view borderColor:(UIColor *)borderColor width:(CGFloat)borderWidth;

//  Animation Rotate
- (void)runSpinAnimationOnView:(UIView *)view duration:(CGFloat)duration repeat:(float)repeat direction:(int)direction axis:(int)axis;


//Date
- (NSString *)getDay:(NSDate *)date;
- (NSString *)getDayOfWeek:(NSDate *)date;
- (NSString *)getMonth:(NSDate *)date;
- (NSDate *)getNextDate:(NSDate *)date;

//Alert
- (void)showAlert:(NSString *)title withMessage:(NSString *)message withViewController:(UIViewController *)vc;
- (void)showVAlertSimple:(NSString *)title body:(NSString *)body duration:(float)duration;
-(void)vAlertSimpleThread;

//Check
- (BOOL) isFormEmpty:(NSMutableArray *)array;

//ActivityIndicator
- (void)showActivityIndicatorColored:(UIView *)inView;
- (void)hideActivityIndicator;

//Common Httl Request Methods
- (id) httpJsonRequest:(NSString *) urlStr withJSON:(NSMutableDictionary *)params;
@end