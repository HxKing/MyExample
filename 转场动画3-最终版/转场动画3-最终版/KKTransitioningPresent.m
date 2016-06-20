//
//  KKTransitioningPresent.m
//  转场动画3-最终版
//
//  Created by 王亚康 on 16/4/13.
//  Copyright © 2016年 kingw. All rights reserved.
//

#import "KKTransitioningPresent.h"

@implementation KKTransitioningPresent


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    // 获取目标view
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    // 获取容器view
    UIView *contentView = [transitionContext containerView];
    
    // 将目标view添加到容器view中
    [contentView addSubview:toView];
    
    toView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    
    [UIView animateWithDuration:0.5 animations:^{
        toView.transform = CGAffineTransformIdentity;
    }completion:^(BOOL finished) {
        // 只有掉用此方法，才能让目标view 响应事件
        [transitionContext completeTransition:YES];
    }];
    
    
    
    
}


@end
