//
//  CustomPresentationVC.m
//  VCPresentationDemo
//
//  Created by 求攻略 on 15/12/4.
//  Copyright © 2015年 求攻略. All rights reserved.
//

#import "CustomPresentationVC.h"

@interface CustomPresentationVC()

@property (nonatomic,strong) UIView *dimmingView;

@end

@implementation CustomPresentationVC
- (UIView *)dimmingView {
    if(!_dimmingView) {
        _dimmingView = [[UIView alloc] init];
        _dimmingView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
        _dimmingView.alpha = 0;
    }
    return _dimmingView;
}
- (void)presentationTransitionWillBegin {
    //切出的frameVC
    UIView *containerView = self.containerView;
    //切入的toVC
    UIView *presenredView = self.presentedView;
    
    self.dimmingView.frame = containerView.bounds;
    
    [containerView addSubview:self.dimmingView];
    [containerView addSubview:presenredView];
    
    [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.alpha = 1.0;
    } completion:nil];
    
}
- (void)presentationTransitionDidEnd:(BOOL)completed {
    if(!completed) {
        [self.dimmingView removeFromSuperview];
    }
}
- (void)dismissalTransitionWillBegin {
    [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.alpha = 0;
    } completion:nil];
}
- (void)dismissalTransitionDidEnd:(BOOL)completed {
    if(completed) {
        [self.dimmingView removeFromSuperview];
    }
    
}
-(CGRect)frameOfPresentedViewInContainerView {
    //切出的frameVC
    UIView *containerView = self.containerView;
    CGRect frame = CGRectInset(containerView.bounds, 50, 50);
    return frame;
}
@end
