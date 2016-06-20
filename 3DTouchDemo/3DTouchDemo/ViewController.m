

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    
    // 创建赞操作
    UIPreviewAction *item1 = [UIPreviewAction actionWithTitle:@"赞" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"赞了%@",self.httpUrl);
    }];
    
    UIPreviewAction *item2 = [UIPreviewAction actionWithTitle:@"评论" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"评论了%@",self.httpUrl);
    }];
    
    UIPreviewAction *item3 = [UIPreviewAction actionWithTitle:@"item3" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"item3");
    }];
    
    // 创建一个组包涵赞和评论
    UIPreviewActionGroup *group = [UIPreviewActionGroup actionGroupWithTitle:@"组" style:UIPreviewActionStyleDefault actions:@[item1,item2]];
    
    return @[group,item3];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = CGRectMake(0, 0, size.width, size.height);
    [self.view addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:self.httpUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
