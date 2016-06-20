
// 这个模型名字太low了。。。

#import <Foundation/Foundation.h>

@interface ModelDemo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *path;


- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)ModelDemoWithDic:(NSDictionary *)dic;

@end
