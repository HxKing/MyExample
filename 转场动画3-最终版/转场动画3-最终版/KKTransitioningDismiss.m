//
//  KKTransitioningDismiss.m
//  转场动画3-最终版
//
//  Created by 王亚康 on 16/4/13.
//  Copyright © 2016年 kingw. All rights reserved.
//

#import "KKTransitioningDismiss.h"

@implementation KKTransitioningDismiss

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    // 获取from view
    UIView *fromeView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    [UIView animateWithDuration:0.5 animations:^{
        if (fromeView.transform.b>0) {
            
            fromeView.transform = CGAffineTransformMakeRotation(M_PI_2);
            
        }else{
            
            fromeView.transform = CGAffineTransformMakeRotation(-M_PI_2);
        }
        
    }completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
