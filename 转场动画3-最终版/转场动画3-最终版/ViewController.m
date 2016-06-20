//
//  ViewController.m
//  转场动画3-最终版
//
//  Created by 王亚康 on 16/4/13.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"
#import "KKVideoController.h"
//#import "KKTransitioningPresent.h"
//#import "KKTransitioningDismiss.h"

#import "KKTransitioningAnimation.h"


@interface ViewController ()<UIViewControllerTransitioningDelegate>
- (IBAction)showVc:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showVc:(UIButton *)sender {
    
    KKVideoController *videoVc = [[KKVideoController alloc] init];
    // 系统自带转场动画
//    videoVc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    // 自定义转场动画
    videoVc.modalPresentationStyle = UIModalPresentationCustom;
    
    // 实现代理
    videoVc.transitioningDelegate = self;
    
    [self presentViewController:videoVc animated:YES completion:nil];

}

#pragma mark - UIViewControllerTransitioningDelegate 代理

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
//    KKTransitioningPresent *present = [[KKTransitioningPresent alloc] init];
//    return present;
    
    return [KKTransitioningAnimation transitionAnimation:KKTransitioningPresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
//    KKTransitioningDismiss *dismiss = [[KKTransitioningDismiss alloc] init];
//    return dismiss;
    return [KKTransitioningAnimation transitionAnimation:KKTransitioningDismiss];
}


@end
