//
//  CTFrameParser.h
//  coreText4
//
//  Created by 王亚康 on 16/5/18.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextData.h"
#import "CTFrameParserConfig.h"


@interface CTFrameParser : NSObject

+ (CoreTextData *)parseTemplateFile:(NSString *)path config:(CTFrameParserConfig*)config;

+ (CoreTextData *)parseContent:(NSString *)content config:(CTFrameParserConfig*)config;




@end
