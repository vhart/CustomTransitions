//
//  ViewController.m
//  CustomTransition
//
//  Created by Varindra Hart on 11/14/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "ViewController.h"
#import "TransitionAnimator.h"

@interface ViewController () <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    segue.destinationViewController.transitioningDelegate = self;
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    
    TransitionAnimator *animator = [TransitionAnimator new];
    animator.presenting = YES;
    
    return animator;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    TransitionAnimator *animator = [TransitionAnimator new];
    animator.presenting = NO;
    
    return animator;
    
}


- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    
    TransitionAnimator *animator = [TransitionAnimator new];
    if (operation == UINavigationControllerOperationPush) {
        
        
        animator.presenting = YES;
        
        return animator;
    }
    else{
        animator.presenting = NO;
        return animator;
    }
    return nil;
    
}


@end
