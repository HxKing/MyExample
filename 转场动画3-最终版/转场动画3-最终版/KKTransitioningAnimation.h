//
//  KKTransitioningAnimation.h
//  转场动画3-最终版
//
//  Created by 王亚康 on 16/4/13.
//  Copyright © 2016年 kingw. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    KKTransitioningPresent,
    KKTransitioningDismiss
} KKTransitioning;

@interface KKTransitioningAnimation : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionAnimation:(KKTransitioning)transitiong;
- (instancetype)initWithTransitionAnimation:(KKTransitioning)transitiong;

@end
