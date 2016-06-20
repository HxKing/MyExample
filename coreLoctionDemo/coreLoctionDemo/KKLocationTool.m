//
//  KKLocationTool.m
//  coreLoctionDemo
//
//  Created by 王亚康 on 16/6/7.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "KKLocationTool.h"
#import <CoreLocation/CoreLocation.h>


@interface KKLocationTool()

/** <#注释#> */
@property (nonatomic, strong) CLLocationManager *locationManager;
/** <#注释#> */
@property (nonatomic, strong) CLGeocoder *geo;

/** <#注释#> */
@property (nonatomic, weak) clpBlock timeBlock;


@end


@implementation KKLocationTool

- (instancetype)sharedInstance{
    
    static KKLocationTool * l;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        l = [[KKLocationTool alloc] init];
    });
    
    return l;
}


- (void)loactionOnceCity:(clpBlock)clpBlock{
    
    self.timeBlock = clpBlock;
    
//    self.locationManager = [[CLLocationManager alloc] init];
//    self.locationManager.delegate = self;
//    
//    self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
//    
//    [self.locationManager requestWhenInUseAuthorization];
//    
//    [self.locationManager startUpdatingLocation];
    
}



@end
