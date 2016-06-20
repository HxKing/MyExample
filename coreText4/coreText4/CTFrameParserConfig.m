//
//  CTFrameParserConfig.m
//  coreText4
//
//  Created by 王亚康 on 16/5/18.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "CTFrameParserConfig.h"

@implementation CTFrameParserConfig

- (id)init {
    self = [super init];
    if (self) {
        _width = 200.0f;
        _fontSize = 26.0f;
        _lineSpace = 8.0f;
        _textColor = RGB(108, 108, 108);
    }
    return self;
}


@end
