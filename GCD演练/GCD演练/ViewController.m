//
//  ViewController.m
//  GCD演练
//
//  Created by 王亚康 on 16/4/14.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    dispatch_source_t source;
//    dispatch_queue_t queueAll1;
//    dispatch_queue_t queueAll2;
    dispatch_queue_t queueAll;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self test18];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [self test16];
//    dispatch_resume(queueAll);
   
//    dispatch_suspend(queueAll1);
    
    [self test19];
}

- (void)test19{
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    for (int i = 0; i< 20; i++) {
        dispatch_async(queue, ^{
            
            NSLog(@"%@ - %d",[NSThread currentThread],i);
        });
    }
    
    
}


#pragma  mark - dispatch_resume(queue);
- (void)test18{
    // 有效
    queueAll = dispatch_queue_create("hh", NULL);
    // 无效
//    queueAll = dispatch_queue_create("hh", DISPATCH_QUEUE_CONCURRENT);
    // 无效
//    queueAll = dispatch_get_main_queue();
    
    
    for (int i =0 ; i<10; i++) {
        dispatch_async(queueAll, ^{
            
            NSLog(@"%@ - %d",[NSThread currentThread],i);
        });
    }
    
    
    
    dispatch_suspend(queueAll);
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        
//        for (int i =0 ; i<10; i++) {
//            dispatch_sync(queueAll, ^{
//                
//                NSLog(@"%@ - %d",[NSThread currentThread],i);
//            });
//        }
//    });
//    dispatch_suspend(queueAll);
//    
    
}


#pragma mark - 串行队列，同步执行
- (void)test16{
    dispatch_queue_t queue = dispatch_queue_create("hahah", NULL);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
 
        for (int i = 0; i<10; i++) {
            // 同步执行，是在当前线程中执行
            dispatch_sync(queue, ^{
                
                NSLog(@"%@ - %d",[NSThread currentThread],i);
            });
        }
    });
    
}


#pragma mark - 之前之后同步
- (void)test15{
    
    dispatch_queue_t queue = dispatch_queue_create("hahah", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i<10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"111 - %@ - %d",[NSThread currentThread],i);
        });
    }
    
    dispatch_barrier_sync(queue, ^{
        NSLog(@"%@ - 2222",[NSThread currentThread]);

    });
    
    for (int i = 0; i<10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"333 - %@ - %d",[NSThread currentThread],i);
        });
    }

}

#pragma mark - 之前之后异步
- (void)test14{
    
    // 必须传DISPATCH_QUEUE_CONCURRENT，不然和dispatch_async一样
    dispatch_queue_t queue = dispatch_queue_create("kk", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    for (int i = 0; i<10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"111 - %@ - %d",[NSThread currentThread],i);
        });
    }
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"%@ - 2222",[NSThread currentThread]);
    });
    
    for (int i = 0; i<10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"333 - %@ - %d",[NSThread currentThread],i);
        });
    }
    
    
 
}


#pragma mark - 发送和等待信号
- (void)test13{
    //创建一个信号，其中的参数为信号的初始值
    dispatch_semaphore_t singer = dispatch_semaphore_create(0);
    //发送信号，使信号量+1
    dispatch_semaphore_signal(singer);
    //等待信号，当信号量大于0时执行后面的方法，否则等待，第二个参数为等待的超时时长，下面设置的为一直等待
    dispatch_semaphore_wait(singer, DISPATCH_TIME_FOREVER);
    NSLog(@"123");

}
#pragma mark - 消息传递机制
- (void)test12{
    //创建一个数据对象，DISPATCH_SOURCE_TYPE_DATA_ADD的含义表示数据变化时相加
    source = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, dispatch_get_main_queue());
    //创建接收数据变化的句柄
    dispatch_source_set_event_handler(source, ^{
        NSLog(@"%lu",dispatch_source_get_data(source));
    });
    //启动
    dispatch_resume(source);
    //设置数据
    dispatch_source_merge_data(source, 2);
    //这步执行完之后会执行打印方法
    
}

#pragma mark - gcd多核心
- (void)test11{
    dispatch_apply(20, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t i) {
        NSLog(@"%@:%zu",[NSThread currentThread],i);
    });
    
    NSLog(@"over %@",[NSThread currentThread]);

}

- (void)test10{
    // Do any additional setup after loading the view, typically from a nib.
    //创建一个队列组
    dispatch_group_t group=dispatch_group_create();
    //创建一个队列
    dispatch_queue_t queue=dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_suspend(queue);
    //添加队列任务到队列组
    dispatch_group_async(group, queue, ^{
        for (int i=0; i<10; i++) {
            NSLog(@"%@:---(1)--%d",[NSThread currentThread],i);
        }
    });
    dispatch_group_async(group, queue, ^{
        for (int i=0; i<10; i++) {
            NSLog(@"%@:---(2)--%d",[NSThread currentThread],i);
        }
    });
    //队列组任务执行完后执行的任务
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i=0; i<10; i++) {
            NSLog(@"over:%d",i);
        }
    });
    for (int i=0; i<10; i++) {
        NSLog(@"%@:-fin-(3)--%d",[NSThread currentThread],i);
    }

}


#pragma mark - 队列组
- (void)test9{
    
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queueAll1 = dispatch_queue_create("hahaha1", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_queue_t queueAll2 = dispatch_queue_create("hahaha2", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, queueAll1, ^{
       
        for (int i =0 ; i<10; i++) {
            NSLog(@"%s - %d - %@",dispatch_queue_get_label(queueAll1),i,[NSThread currentThread]);
        }
        
    });
    
    dispatch_group_async(group, queueAll2, ^{
        for (int i =0 ; i<10; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"%s - %d - %@",dispatch_queue_get_label(queueAll2),i,[NSThread currentThread]);
        }
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        for (int i =0 ; i<10; i++) {
            NSLog(@"%s - %d - %@",dispatch_queue_get_label(dispatch_get_main_queue()),i,[NSThread currentThread]);
        }
    });
    
    
}


#pragma mark - 全剧队列 异步执行
- (void)test7{
 
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i =0 ; i<20; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@ - %d",[NSThread currentThread],i);
            
        });
    }
    
    dispatch_suspend(queue);
    
}

#pragma mark - 主队列 同步执行
// 死锁
- (void)test6{
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    for (int i =0 ; i<20; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%@ - %d",[NSThread currentThread],i);
        });
    }
    
}

#pragma mark - 主队列 异步执行
// 在主线程中执行
- (void)test5{
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    for (int i =0 ; i<20; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@ - %d",[NSThread currentThread],i);
        });
    }
    
}

#pragma mark - 并发队列，同步执行
- (void)test8{
    
    dispatch_queue_t queue = dispatch_queue_create("haha5", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i<20; i++) {
        
        dispatch_async(queue, ^{
            NSLog(@"%@ - %d",[NSThread currentThread],i);
        });
    }
    
}


#pragma mark - 并发队列，同步执行
- (void)test4{
    
    dispatch_queue_t queue = dispatch_queue_create("haha4", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i<20; i++) {
        
        dispatch_sync(queue, ^{
            NSLog(@"%@ - %d",[NSThread currentThread],i);
        });
    }
    
}

#pragma mark - 串行队列，异步执行
- (void)test3{
    
    dispatch_queue_t queue = dispatch_queue_create("haha2", NULL);
    
    for (int i = 0; i<20; i++) {
        dispatch_async(queue, ^{
//            [NSThread sleepForTimeInterval:1.0];
            
            NSLog(@"%d - %@",i,[NSThread currentThread]);
        });
    }
    
}


#pragma mark - GCD死锁串行队列死锁2
- (void)test2{
    
    dispatch_queue_t queue = dispatch_queue_create("haha", DISPATCH_QUEUE_SERIAL);
    
    NSLog(@"001 - %@",[NSThread currentThread]);
    
    dispatch_async(queue, ^{
        NSLog(@"002 - %@",[NSThread currentThread]);
        dispatch_sync(queue, ^{
            NSLog(@"003 - %@",[NSThread currentThread]);

        });
        NSLog(@"004 - %@",[NSThread currentThread]);
   
    });
    NSLog(@"005 - %@",[NSThread currentThread]);
}



#pragma mark - GCD死锁串行队列死锁
- (void)test{
//    NSLog(@"zhi qian %@",[NSThread currentThread]);
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"sync - %@",[NSThread currentThread]);
    });
//    NSLog(@"zhi hou %@",[NSThread currentThread]);
    
    /**
     *  注意：
        代码执行到第二句。dispatch这里。
        这句代码会阻塞线程。也就是，现在主线程已经被阻塞。
        然后，它很高兴的把，block中的代码，放到了main_queue里。
        然而，main_queue会取出block放到主线程里去执行。
        可是，现在主线程还是被阻塞着。要等block执行完，才可以不阻塞。
        block，放到主线程，才能被执行。
     *
     */
}


@end
