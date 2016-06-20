//
//  KKVideoController.m
//  转场动画3-最终版
//
//  Created by 王亚康 on 16/4/13.
//  Copyright © 2016年 kingw. All rights reserved.
//

#import "KKVideoController.h"


@interface KKVideoController ()

@end

@implementation KKVideoController


- (void)loadView{
    
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor orangeColor];
    self.view.layer.anchorPoint = CGPointMake(0.5, 2);
    self.view.frame = [UIScreen mainScreen].bounds;
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPanView:)];
    
    [self.view addGestureRecognizer:pan];

    
}

- (void)didPanView:(UIPanGestureRecognizer *)panGesture{
    
    if (panGesture.state == UIGestureRecognizerStateEnded || panGesture.state == UIGestureRecognizerStateCancelled) {
        
        if (ABS(panGesture.view.transform.b)>0.16) {
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
            [UIView animateWithDuration:0.5 animations:^{
                
                panGesture.view.transform = CGAffineTransformIdentity;
            }];
        }
        
    }else{
        
        
        CGFloat pointX= [panGesture translationInView:panGesture.view].x;
        
        CGFloat moveW = pointX/self.view.bounds.size.width;
        
        CGFloat r = M_PI_4 * moveW;
        
        panGesture.view.transform = CGAffineTransformMakeRotation(r);
    }
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:btn];
    
    btn.frame = CGRectMake(100, 100, 50, 50);
    [btn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


- (void)back:(UIButton *)btn{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
