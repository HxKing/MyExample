//
//  KKHomeCell.h
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/4.
//  Copyright © 2016年 王亚康. All rights reserved.
//


#import <UIKit/UIKit.h>
@class KKNews;

@interface KKHomeCell : UITableViewCell

+ (KKHomeCell *)homeCell;

/** <#注释#> */
@property (nonatomic, copy) NSString *str;

/** <#注释#> */
@property (nonatomic, strong) KKNews *news;

+ (instancetype)homeCell:(UITableView *)table;

@end
