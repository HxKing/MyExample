//
//  CoreTextData.h
//  coreText4
//
//  Created by 王亚康 on 16/5/18.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextImageData.h"

@interface CoreTextData : NSObject

@property (assign, nonatomic) CTFrameRef ctFrame;
@property (assign, nonatomic) CGFloat height;

// 新增加的成员
@property (strong, nonatomic) NSArray * imageArray;


@end
