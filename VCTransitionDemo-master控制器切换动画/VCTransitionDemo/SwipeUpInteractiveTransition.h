//
//  SwipeUpInteractiveTransition.h
//  VCTransitionDemo
//
//  Created by 王 巍 on 13-10-13.
//  Copyright (c) 2013年 王 巍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeUpInteractiveTransition : UIPercentDrivenInteractiveTransition
//设定了一个BOOL变量来表示是否处于切换过程中
@property (nonatomic, assign) BOOL interacting;
- (void)wireToViewController:(UIViewController*)viewController;
@end
