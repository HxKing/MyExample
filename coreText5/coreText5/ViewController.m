//
//  ViewController.m
//  coreText5
//
//  Created by 王亚康 on 16/5/19.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"
#import "XDisView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet XDisView *disView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self.disView];
    
    NSLog(@"%@",NSStringFromCGPoint(p));
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
