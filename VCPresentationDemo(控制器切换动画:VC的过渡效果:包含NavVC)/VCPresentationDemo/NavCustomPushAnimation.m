//
//  NavCustomPushAnimation.m
//  VCPresentationDemo
//
//  Created by 求攻略 on 15/12/4.
//  Copyright © 2015年 求攻略. All rights reserved.
//

#import "NavCustomPushAnimation.h"

@implementation NavCustomPushAnimation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    //pop页面
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //push页面
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}

@end
