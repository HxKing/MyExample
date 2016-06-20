//
//  Dog.h
//  coreData3
//
//  Created by 王亚康 on 16/5/25.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Dog : NSManagedObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;

@end
