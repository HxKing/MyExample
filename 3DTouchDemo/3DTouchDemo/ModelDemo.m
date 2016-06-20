

#import "ModelDemo.h"

@implementation ModelDemo
- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)ModelDemoWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}


@end
