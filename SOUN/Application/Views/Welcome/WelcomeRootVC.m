//
//  WelcomeRootVC.m
//  SOUN
//
//  Created by Apple Developer on 4/5/16.
//  Copyright © 2016 Guus Teuwen. All rights reserved.
//

#import "WelcomeRootVC.h"

@interface WelcomeRootVC ()

@end

@implementation WelcomeRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
}

- (void)initUI {
//  Create page view controller
    _pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    _pageViewController.dataSource = self;
    
    WelcomeChildVC *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [_pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
//  Change the size of page view controller
    _pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, _skipButton.frame.origin.y);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [_pageViewController didMoveToParentViewController:self];
    
//  Rounded Skip Button
    [commonUtils setRoundedView:_skipButton radius:_skipButton.frame.size.height/2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = ((WelcomeChildVC*) viewController).index;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = ((WelcomeChildVC*) viewController).index;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    
    if (index == 3) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}


- (WelcomeChildVC *)viewControllerAtIndex:(NSUInteger)index {
    if (index >= 3) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    WelcomeChildVC *childViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WelcomeChildVC"];
    childViewController.index = index;
    
    return childViewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

@end
