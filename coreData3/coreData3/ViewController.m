//
//  ViewController.m
//  coreData3
//
//  Created by 王亚康 on 16/5/25.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"
#import "KKCoreData.h"
#import "Dog.h"


@interface ViewController (){
    KKCoreData *cd;
}

/** <#注释#> */
//@property (nonatomic, strong) KKCoreData *cd;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.cd = [[KKCoreData alloc] init];
    cd =[[KKCoreData alloc] init];
    
    [self add];
    [self select];
    
}

- (void)add{
    
    // 控制Core Data在托管对象上下文中创建一个新实体
    Dog *d = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:cd.managedObjectContext];
    // 为新实体设置属性
    d.name = @"haha1";
    d.age = [NSString stringWithFormat:@"%d",rand()%10];
    
    // 定义一个NSError对象，用于接受错误信息
    NSError *error;
    // 设置完实体属性之后，调用托管对象上下文的`save:`方法将实体写入数据库，如果保存成功
    if ([cd.managedObjectContext save:&error])
    {
        NSLog(@"保存成功");
    }
    else
    {
        NSLog(@"保存FKEvent实体出错: %@,%@" , error ,[error userInfo]);
    }
}


- (void)select{
    
    NSEntityDescription *ed = [NSEntityDescription entityForName:@"Dog" inManagedObjectContext:cd.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:ed];
    
    NSArray *arr = [cd.managedObjectContext executeFetchRequest:request error:nil];
    
    for (Dog *d in arr) {
        NSLog(@"%@",d.name);
    }
}


@end
