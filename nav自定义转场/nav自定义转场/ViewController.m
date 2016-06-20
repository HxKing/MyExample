//
//  ViewController.m
//  nav自定义转场
//
//  Created by 王亚康 on 16/4/14.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "KKSecondViewController.h"
#import "KKPushAnimation.h"

@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

static NSString * const reuseIdentifier = @"CollectionCell";


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    
    if ([toVC isKindOfClass:[KKSecondViewController class]]) {
        KKPushAnimation *transition = [[KKPushAnimation alloc]init];
        return transition;
    }else{
        return nil;
    }
}


#pragma mark <UICollectionViewDataSource>
//section的数目
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//每个section Item的数目
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

//创建cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}


@end
