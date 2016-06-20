//
//  ViewController.m
//  mapKitDemo
//
//  Created by 王亚康 on 16/5/12.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
/** 位置管理者 */
@property (nonatomic, strong) CLLocationManager *locationM;
@end

@implementation ViewController
/** 位置管理者 */
- (CLLocationManager *)locationM
{
    if (!_locationM) {
        _locationM = [[CLLocationManager alloc] init];
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
            [_locationM requestAlwaysAuthorization];
        }
    }
    return _locationM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.mapView = [[MKMapView alloc] init];
//    self.mapView.mapType = MKMapTypeSatellite;
    
    // 设置地图的操控项
    // 是否可以滚动
    //    self.mapView.scrollEnabled = NO;
    // 是否可以旋转
    //    self.mapView.rotateEnabled = NO;
    // 是否可以缩放
    //    self.mapView.zoomEnabled = NO;
    

    
    // 设置地图的显示项
//    // 指南针
//    self.mapView.showsCompass = YES;
//    // 比例尺
//    self.mapView.showsScale = YES;
//    // 显示交通
//    self.mapView.showsTraffic = YES;
//    // 兴趣点
//    self.mapView.showsPointsOfInterest = YES;
//    // 建筑物
//    self.mapView.showsBuildings = YES;
    
    // 显示用户位置
    [self locationM];
    // 只是在地图上, 添加一个蓝点 , 标示用户当前位置, 不会自动放大地图
    // 不会追踪用户的位置信息,
//    self.mapView.showsUserLocation = YES;
    
    
    // 设置用户追踪模式
    // 在地图上, 添加一个蓝点 , 标示用户当前位置, 会自动放大地图
    //  还会, 自动追踪用户的位置, (不灵光)
    self.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    
    
}


#pragma mark - MKMapViewDelegate
/**
 *  当地图获取到用户位置时调用
 *
 *  @param mapView      地图
 *  @param userLocation 大头针数据模型
 */
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    /**
     *  MKUserLocation  大头针数据模型
     *  其实, 喊什么都行, 只不过, 这个类, 遵循了大头针数据模型, 必须遵循的一个协议 MKAnnotation
     location : 当前的位置数据模型
     heading : 当前朝向
     title : 标题
     subtitle : 子标题
     */
    userLocation.title = @"小码哥";
    userLocation.subtitle = @"大神武器";
    
    // 显示当前地图的中心, 在哪个具体的经纬度坐标
    // 不会自动放大地图比例
    //    [self.mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    
    
//    CLLocationCoordinate2D centerCoordinate = userLocation.location.coordinate;
//    MKCoordinateSpan span = MKCoordinateSpanMake(0.027023, 0.018108);
//    MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate,span);
//    // 设置地图显示区域
//    [self.mapView setRegion:region animated:YES];
//    
    
}

/**
 *  地图区域改变时调用
 *
 *  @param mapView  地图
 *  @param animated 动画
 */
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"%f---%f", mapView.region.span.latitudeDelta, mapView.region.span.longitudeDelta);
}

@end
