//
//  RWDropdownMenuTransitionController.m
//  DirtyBeijing
//
//  Created by Zhang Bin on 14-01-20.
//  Copyright (c) 2014年 Fresh-Ideas Studio. All rights reserved.
//

#import "RWDropdownMenuTransitionController.h"
#import "RWDropdownMenu.h"

@interface RWDropdownMenu (TransitionController)

- (void)enterTheStageWithCompletion:(void (^)(void))completion;
- (void)leaveTheStageWithCompletion:(void (^)(void))completion;

@end

@interface RWDropdownMenuTransitionController ()

@property (nonatomic, strong) UIView *snapshotView;

@end

@implementation RWDropdownMenuTransitionController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0; // not used
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    if (self.isDismissing)
    {
        UINavigationController *nav = (UINavigationController *)fromViewController;
        RWDropdownMenu *menu = (RWDropdownMenu *)nav.topViewController;
        
        [menu leaveTheStageWithCompletion:^{
            [nav.view removeFromSuperview];
            [self.snapshotView removeFromSuperview];
            self.snapshotView = nil;
            [transitionContext completeTransition:YES];
        }];
    }
    else
    {
        // fromViewController.view will be disappeared when presenting using UIModalPresentationCurrentContext
        // so we put a snapshot underneath our menu
        self.snapshotView = [container snapshotViewAfterScreenUpdates:NO];
        
        UINavigationController *nav = (UINavigationController *)toViewController;
        RWDropdownMenu *menu = (RWDropdownMenu *)nav.topViewController;
        
        nav.view.frame = container.bounds;
        [container addSubview:nav.view];
        
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [menu.view insertSubview:self.snapshotView atIndex:0];
            self.snapshotView.frame = menu.view.bounds;
            
            [menu enterTheStageWithCompletion:^{
                [transitionContext completeTransition:YES];
            }];
        }];
        
        
    }
}

@end
