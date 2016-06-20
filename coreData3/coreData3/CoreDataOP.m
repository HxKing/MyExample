//
//  CoreDataOP.m
//  coreData3
//
//  Created by 王亚康 on 16/5/25.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "CoreDataOP.h"
#import "KKCoreData.h"

@interface CoreDataOP()

/** <#注释#> */
@property (nonatomic, strong) KKCoreData *cd;

@end


@implementation CoreDataOP

- (KKCoreData *)cd{
    if (!_cd) {
        _cd = [[KKCoreData alloc] init];
    }
    return _cd;
}

- (BOOL)addObj:(id)obj{

     Class ObjClass = [obj class];
    
    // 控制Core Data在托管对象上下文中创建一个新实体
    id o = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(ObjClass) inManagedObjectContext:self.cd.managedObjectContext];
    
    
    
    // 定义一个NSError对象，用于接受错误信息
    NSError *error;
    // 设置完实体属性之后，调用托管对象上下文的`save:`方法将实体写入数据库，如果保存成功
    if ([self.cd.managedObjectContext save:&error])
    {
        NSLog(@"保存成功");
    }
    else
    {
        NSLog(@"保存FKEvent实体出错: %@,%@" , error ,[error userInfo]);
    }

    
    return YES;
}



@end
