//
//  PopAnimantion.m
//  nav自定义转场
//
//  Created by 王亚康 on 16/4/14.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "PopAnimantion.h"
#import "ViewController.h"
#import "KKSecondViewController.h"
#import "CollectionViewCell.h"

@implementation PopAnimantion

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //获取动画前后两个VC 和 发生的容器containerView
    ViewController *toVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    KKSecondViewController *fromVC = (KKSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    //在前一个VC上创建一个截图
    UIView  *snapShotView = [fromVC.secondIconView snapshotViewAfterScreenUpdates:NO];
    snapShotView.backgroundColor = [UIColor clearColor];
    snapShotView.frame = [containerView convertRect:fromVC.secondIconView.frame fromView:fromVC.view];
    fromVC.secondIconView.hidden = YES;
    
    //初始化后一个VC的位置
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    //获取toVC中图片的位置
    CollectionViewCell *cell = (CollectionViewCell *)[toVC.collectionView cellForItemAtIndexPath:toVC.indexPath];
    cell.iconView.hidden = YES;
    //    CGRect finalRect =  [containerView convertRect:cell.imageView.frame fromView:cell.imageView.superview];
    
    
    //顺序很重要，
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    [containerView addSubview:snapShotView];
    
    //发生动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        fromVC.view.alpha = 0.0f;
        snapShotView.frame = toVC.finalCellRect;
    } completion:^(BOOL finished) {
        [snapShotView removeFromSuperview];
        fromVC.secondIconView.hidden = NO;
        cell.iconView.hidden = NO;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}


@end
