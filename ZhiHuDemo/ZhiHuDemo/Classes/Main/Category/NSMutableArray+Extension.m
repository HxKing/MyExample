//
//  NSMutableArray+Extension.m
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/5.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "NSMutableArray+Extension.h"

@implementation NSMutableArray (Extension)

- (void)insertArray:(NSArray *)newAdditions atIndex:(NSInteger)index
{
    NSMutableIndexSet *indexes = [NSMutableIndexSet indexSet];
    for(NSInteger i = index;i < newAdditions.count+index;i++)
    {
        [indexes addIndex:i];
    }
    [self insertObjects:newAdditions atIndexes:indexes];
}

@end
