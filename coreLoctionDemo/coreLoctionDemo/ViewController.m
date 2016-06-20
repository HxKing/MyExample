//
//  ViewController.m
//  coreLoctionDemo
//
//  Created by 王亚康 on 16/6/7.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>

/** <#注释#> */
@property (nonatomic, strong) CLLocationManager *locationManager;
/** <#注释#> */
@property (nonatomic, strong) CLGeocoder *geo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    
    [self.locationManager requestWhenInUseAuthorization];
    
    [self.locationManager startUpdatingLocation];
    
    
    
}


-(void)locationManager:(nonnull CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations
{
    NSLog(@"每当请求到位置信息时, 都会调用此方法");
    
    CLLocation *cll = [locations lastObject];
    
    NSLog(@"%lf , %lf",cll.coordinate.latitude,cll.coordinate.longitude);
    [manager stopUpdatingLocation];
    
    self.geo = [[CLGeocoder alloc] init];
    [self.geo reverseGeocodeLocation:cll completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
       
        NSLog(@"%@",[placemarks firstObject].locality);
        NSLog(@"%@",[placemarks firstObject].name);
        NSLog(@"%@",[placemarks firstObject].thoroughfare);
//        NSLog(@"%@",placemarks);
    }];
    
}

@end
