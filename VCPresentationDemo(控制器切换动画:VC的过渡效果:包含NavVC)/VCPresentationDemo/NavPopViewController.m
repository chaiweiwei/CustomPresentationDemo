//
//  NavPopViewController.m
//  VCPresentationDemo
//
//  Created by 求攻略 on 15/12/4.
//  Copyright © 2015年 求攻略. All rights reserved.
//

#import "NavPopViewController.h"
#import "NavCustomPushAnimation.h"
#import "CustomPresentationAnimationVC.h"

@interface NavPopViewController ()<UINavigationControllerDelegate>

@property (nonatomic,strong) NavCustomPushAnimation *pushAnimation;

@end

@implementation NavPopViewController

- (NavCustomPushAnimation *)pushAnimation {
    if(!_pushAnimation) {
        _pushAnimation = [NavCustomPushAnimation new];
    }
    return _pushAnimation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        //return self.pushAnimation;
        return [[CustomPresentationAnimationVC alloc] init:YES];
    } else {
        return [[CustomPresentationAnimationVC alloc] init:YES];
    }
    return nil;
}

@end
