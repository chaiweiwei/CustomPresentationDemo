//
//  BouncePresentAnimation.m
//  VCTransitionDemo
//
//  Created by 王 巍 on 13-10-13.
//  Copyright (c) 2013年 王 巍. All rights reserved.
//

#import "BouncePresentAnimation.h"

@implementation BouncePresentAnimation
//系统给出一个切换上下文，我们根据上下文环境返回这个切换所需要的花费时间（一般就返回动画的时间就好了，SDK会用这个时间来在百分比驱动的切换中进行帧的计算，后面再详细展开）。
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8f;
}
//在进行切换的时候将调用该方法，我们对于切换时的UIView的设置和动画都在这个方法中完成。
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // 1. Get controllers from transition context
    //提供一个key，返回对应的VC。现在的SDK中key的选择只有UITransitionContextFromViewControllerKey和UITransitionContextToViewControllerKey两种，分别表示将要切出和切入的VC。
    //切入的vc参照物
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. Set init frame for toVC
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    //与上面的方法对应，得到切换结束时某个VC应在的frame。
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];

    //toVC.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
    toVC.view.frame = CGRectMake(0, screenBounds.size.height, 0, 0);
    
    // 3. Add toVC's view to containerView
    //VC切换所发生的view容器，开发者应该将切出的view移除，将切入的view加入到该view容器中。
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    // 4. Do animate now
    //-(void)completeTransition:(BOOL)didComplete; 向这个context报告切换已经完成。
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         toVC.view.frame = finalFrame;
                     } completion:^(BOOL finished) {
                         // 5. Tell context that we completed.
                         //向这个context报告切换已经完成。
                         [transitionContext completeTransition:YES];
                     }];

}
@end
