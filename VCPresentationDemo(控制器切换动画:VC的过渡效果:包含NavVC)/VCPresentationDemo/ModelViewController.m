//
//  ModelViewController.m
//  VCPresentationDemo
//
//  Created by 求攻略 on 15/12/4.
//  Copyright © 2015年 求攻略. All rights reserved.
//

#import "ModelViewController.h"
#import "CustomPresentationAnimationVC.h"
#import "CustomPresentationVC.h"
@interface ModelViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ModelViewController

- (instancetype)init {
    if(self = [super init]) {
        [self commontInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        [self commontInit];
    }
    return self;
}

-(void)commontInit {
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
                                                      presentingViewController:(UIViewController *)presenting
                                                          sourceViewController:(UIViewController *)source {
    if(presented == self) {
        return [[CustomPresentationVC alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    }
    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    
    return [[CustomPresentationAnimationVC alloc] init:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[CustomPresentationAnimationVC alloc] init:NO];
}


@end
