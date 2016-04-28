//
//  TransitionAnimator.m
//  CustomTransition
//
//  Created by Varindra Hart on 11/14/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "TransitionAnimator.h"

@implementation TransitionAnimator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return .5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    
    
    if (self.isPresenting) {
        [[transitionContext containerView] addSubview:fromView];
        [[transitionContext containerView] addSubview:toView];
        
        //sizing
        //toView.frame = CGRectMake(fromView.center.x, fromView.center.y, 10, 20);
        
        //fading
        //toView.alpha = 0.0;
        
        //scaling
        //toView.transform = CGAffineTransformMakeScale(0.0, 0.0);
        
        toView.center = CGPointMake(fromView.center.x - fromView.bounds.size.width*.75, fromView.center.y - 300);
        
        NSTimeInterval duration = [self transitionDuration:transitionContext];
        
        [UIView animateWithDuration:duration animations:^{
            //toView.alpha = 1.0;
            //toView.frame = fromView.bounds;
            //toView.transform = CGAffineTransformMakeScale(1,1);
            toView.center = fromView.center;
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    else{
        
        [[transitionContext containerView] addSubview:toView];
        [[transitionContext containerView] addSubview:fromView];
        
        NSTimeInterval duration = [self transitionDuration:transitionContext];
        
        [UIView animateWithDuration:duration animations:^{
            //toView.alpha = 1.0;
            //toView.frame = fromView.bounds;
            //fromView.transform = CGAffineTransformMakeScale(0,0);
            fromView.alpha = 0;
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}


@end
