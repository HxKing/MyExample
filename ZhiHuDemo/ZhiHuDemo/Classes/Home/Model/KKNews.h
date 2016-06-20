//
//  KKNews.h
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/4.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKNews : NSObject

/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 多图 */
@property (nonatomic, assign, getter=isMultipic) BOOL multipic;
/** 图片 */
@property (nonatomic, strong) NSArray *images;
/** 新闻id */
@property (nonatomic, strong) NSNumber *id;
/** 顶部图片 */
@property (nonatomic, strong) NSString *image;

@end

@interface KKLatest : NSObject

/** date 日期 */
@property (nonatomic, copy) NSString *date;
/** stories  当日新闻*/
@property (nonatomic, strong) NSArray *stories;
/** top_stories  顶部新闻*/
@property (nonatomic, strong) NSArray *top_stories;

@end


