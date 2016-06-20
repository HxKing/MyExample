//
//  KKTransitioningAnimation.m
//  转场动画3-最终版
//
//  Created by 王亚康 on 16/4/13.
//  Copyright © 2016年 kingw. All rights reserved.
//

#import "KKTransitioningAnimation.h"

@interface KKTransitioningAnimation()

/**  */
@property (nonatomic, assign) KKTransitioning type;


@end

@implementation KKTransitioningAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    switch (_type) {
        case KKTransitioningPresent:
            [self persentAnimation:transitionContext];
            break;
        case KKTransitioningDismiss:
            [self dismissAnimation:transitionContext];
            break;
            
        default:
            break;
    }
}

- (void)persentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
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

- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
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

- (instancetype)initWithTransitionAnimation:(KKTransitioning)transitiong{
    self = [super init];
    if (self) {
        _type = transitiong;
    }
    return self;
}

+ (instancetype)transitionAnimation:(KKTransitioning)transitiong{
    return [[self alloc] initWithTransitionAnimation:transitiong];
}


@end
