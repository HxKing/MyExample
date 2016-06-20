//
//  KKCoreData.h
//  coreData3
//
//  Created by 王亚康 on 16/5/25.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface KKCoreData : NSObject

// 定义Core Data的3个核心API的属性
@property (readonly, strong, nonatomic) NSManagedObjectContext*
managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator*
persistentStoreCoordinator;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end
