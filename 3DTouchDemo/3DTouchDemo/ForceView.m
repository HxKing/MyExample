

#import "ForceView.h"

@interface ForceView ()

@property (nonatomic, strong) UIBezierPath *path;

@end


@implementation ForceView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [[UIColor orangeColor] set];
    
    // 渲染
    [self.path fill];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    获取触摸对象
    UITouch *t = touches.anyObject;
    
//    创建路径
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
//    根据压力＊系数 为半径 手指的位置为圆心 画圆
    // force 属性，9_0
    [path addArcWithCenter:[t locationInView:self] radius:t.force*20 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    self.path = path;
    
    // 调用（- (void)drawRect:(CGRect)rect;）
    [self setNeedsDisplay];
    
}


@end
