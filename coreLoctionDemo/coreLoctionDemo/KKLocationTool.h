//
//  KKLocationTool.h
//  coreLoctionDemo
//
//  Created by 王亚康 on 16/6/7.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^clpBlock)(CLPlacemark *);

@interface KKLocationTool : NSObject

- (instancetype)sharedInstance;




@end
