//
//  KKHomeTableHeaderView.h
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/5.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKHomeTableHeaderView : UITableViewHeaderFooterView

/** 日期 */
@property (nonatomic, copy) NSString *date;


+ (instancetype)homeTableHeaderView:(UITableView *)table;

@end
