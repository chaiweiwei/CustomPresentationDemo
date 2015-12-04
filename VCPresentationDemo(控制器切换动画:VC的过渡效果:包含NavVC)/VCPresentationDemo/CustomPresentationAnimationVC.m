//
//  CustomPresentationAnimationVC.m
//  VCPresentationDemo
//
//  Created by 求攻略 on 15/12/4.
//  Copyright © 2015年 求攻略. All rights reserved.
//

#import "CustomPresentationAnimationVC.h"

@interface CustomPresentationAnimationVC(){
    NSTimeInterval duration;
}

@end

@implementation CustomPresentationAnimationVC

-(instancetype)init:(BOOL)isPressing {
    if(self = [self init]) {
        self.isPresenting = isPressing;
        duration = 0.5;
    }
    return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return duration;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.isPresenting) {
        [self animatePresentationWithTransitionContext:transitionContext];
    }else {
        [self animateDismissalWithTransitionContext:transitionContext];
    }
}
- (void)animatePresentationWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toVCView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIView *containerView = [transitionContext containerView];
    
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVCView.frame = finalFrame;
    CGPoint center = toVCView.center;
    center.y -= containerView.bounds.size.height;
    toVCView.center = center;
    
    [containerView addSubview:toVCView];
    
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:1.0
          initialSpringVelocity:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         CGPoint center = toVCView.center;
                         center.y += containerView.bounds.size.height;
                         toVCView.center = center;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:finished];
    }];

}
- (void)animateDismissalWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {

    UIView *frameVCView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *containerView = [transitionContext containerView];

    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:1.0
          initialSpringVelocity:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         CGPoint center = frameVCView.center;
                         center.y += containerView.bounds.size.height;
                         frameVCView.center = center;
                         
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:finished];
                     }];

}
@end
