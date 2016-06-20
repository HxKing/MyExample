//
//  ViewController.m
//  label动画
//
//  Created by 王亚康 on 16/6/15.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *colLabel;


@end

@implementation ViewController
- (IBAction)btnClick:(id)sender {
    
    self.colLabel.text = @"23456789";
    [self.colLabel sizeToFit];
    
    
    CABasicAnimation *ani = [[CABasicAnimation alloc] init];
    ani.keyPath = @"transform.translation.x";
    ani.toValue = @200;
    ani.duration = 2.0;
    
    [self.colLabel.layer addAnimation:ani forKey:nil];
    

    
    
}

- (UILabel *)colLabel{
    if (!_colLabel) {
        _colLabel = [[UILabel alloc] init];
        _colLabel.backgroundColor = [UIColor orangeColor];
        self.colLabel.x = 10;
        self.colLabel.y = 100;
    }
    return _colLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.colLabel];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
