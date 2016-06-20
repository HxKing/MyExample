//
//  ViewController.m
//  ios毛玻璃
//
//  Created by 王亚康 on 16/3/26.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"

//NS_CLASS_AVAILABLE_IOS(8_0) @interface UIVisualEffectView : UIView <NSSecureCoding>
//在后面有介绍
//@property (nonatomic, strong, readonly) UIView *contentView; // Do not add subviews directly to UIVisualEffectView, use this view instead.
//获得UIVissualEffect对象
//@property (nonatomic, copy, nullable) UIVisualEffect *effect;
//@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIVisualEffectView *vis = [[UIVisualEffectView alloc] init];
//    UIBlurEffect *blur = [[UIBlurEffect alloc] init];
//    UIVibrancyEffect *vibr = [[UIVibrancyEffect alloc] init];

    UIImageView * view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UIImage * img = [UIImage imageNamed:@"1.jpg"];
    
//    UIVisualEffectView * effectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];

//    UIVisualEffectView *vise = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    UIVibrancyEffect *vibrancy = [UIVibrancyEffect effectForBlurEffect:blur];
    
    UIVisualEffectView *vise = [[UIVisualEffectView alloc] initWithEffect:vibrancy];
    
    UILabel *lab = [[UILabel alloc] init];
    lab.frame = CGRectMake(50, 215, 300, 70);
    lab.font = [UIFont systemFontOfSize:22];
    
    lab.text = @"UIBlurEffectStyleDark";
    
    [vise.contentView addSubview:lab];
    
    vise.alpha=1.0;
    vise.frame=CGRectMake(0, 0, self.view.frame.size.width, 400);
    view.image=img;
    [view addSubview:vise];
    [self.view addSubview:view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
