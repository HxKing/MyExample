//
//  KKHomeTableHeaderView.m
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/5.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "KKHomeTableHeaderView.h"
#import "NSString+Extension.h"

@implementation KKHomeTableHeaderView

+ (instancetype)homeTableHeaderView:(UITableView *)table{
    
    static NSString *ID = @"homeHeaderView";
    KKHomeTableHeaderView *header = [table dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (!header) {
        header = [[KKHomeTableHeaderView alloc] init];
        header.contentView.backgroundColor = kColor(23, 144, 211, 1);
    }
    return header;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.textLabel.centerX = self.centerX;
    
}

- (void)setDate:(NSString *)date{
    _date = [date copy];
    
    NSString *dateStr = [_date dateToMMddEEE];
    self.textLabel.attributedText = [[NSAttributedString alloc] initWithString:dateStr attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    
    
}

@end
