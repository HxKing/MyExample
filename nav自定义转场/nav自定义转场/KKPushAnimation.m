//
//  KKPushAnimation.m
//  nav自定义转场
//
//  Created by 王亚康 on 16/4/14.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "KKPushAnimation.h"
#import "CollectionViewCell.h"
#import "ViewController.h"
#import "KKSecondViewController.h"

@implementation KKPushAnimation

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    KKSecondViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    ViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *contentView = [transitionContext containerView];
    
    //对Cell上的 imageView 截图，同时将这个 imageView 本身隐藏
    CollectionViewCell *cell =(CollectionViewCell *)[fromVc.collectionView cellForItemAtIndexPath:[[fromVc.collectionView indexPathsForSelectedItems] firstObject]];
    
    UIView * snapShotView = [cell.iconView snapshotViewAfterScreenUpdates:NO];
    
    snapShotView.frame = fromVc.finalCellRect = [contentView convertRect:cell.iconView.frame fromView:cell.iconView.superview];
    
    cell.iconView.hidden = YES;
    
    //设置第二个控制器的位置、透明度、
    toVc.view.frame = [transitionContext finalFrameForViewController:toVc];
    toVc.view.alpha = 0;
    toVc.secondIconView.hidden = YES;
    
    //把动画前后的两个ViewController加到容器中
    [contentView addSubview:toVc.view];
    [contentView addSubview:snapShotView];

    //动起来。第二个控制器的透明度0~1；让截图SnapShotView的位置更新到最新；
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveLinear animations:^{
        [contentView layoutIfNeeded];
        toVc.view.alpha = 1.0;
        snapShotView.frame = [contentView convertRect:toVc.secondIconView.frame fromView:toVc.view];
    } completion:^(BOOL finished) {
        //为了让回来的时候，cell上的图片显示，必须要让cell上的图片显示出来
        toVc.secondIconView.hidden = NO;
        cell.iconView.hidden = NO;
        [snapShotView removeFromSuperview];
        //告诉系统动画结束
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}


@end
