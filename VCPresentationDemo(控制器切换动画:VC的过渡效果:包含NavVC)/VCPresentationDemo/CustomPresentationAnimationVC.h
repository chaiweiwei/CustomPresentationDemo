//
//  CustomPresentationAnimationVC.h
//  VCPresentationDemo
//
//  Created by 求攻略 on 15/12/4.
//  Copyright © 2015年 求攻略. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CustomPresentationAnimationVC : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,assign) BOOL isPresenting;

- (instancetype)init:(BOOL) isPressing;

@end
