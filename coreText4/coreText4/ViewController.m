//
//  ViewController.m
//  coreText4
//
//  Created by 王亚康 on 16/5/18.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "ViewController.h"
#import "CTFrameParserConfig.h"
#import "CTFrameParser.h"
#import "XDisView.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet XDisView *ctView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CTFrameParserConfig *fig = [[CTFrameParserConfig alloc] init];
    fig.width = self.ctView.width;
    fig.fontSize = 12;
    fig.textColor = [UIColor orangeColor];
    
    
    CoreTextData *textDate = [CTFrameParser parseContent:@" 对于上面的例子，我们给 CTFrameParser 增加了一个将 NSString 转 "
                              " 换为 CoreTextData 的方法。"
                              " 但这样的实现方式有很多局限性，因为整个内容虽然可以定制字体 "
                              " 大小，颜色，行高等信息，但是却不能支持定制内容中的某一部分。"
                              " 例如，如果我们只想让内容的前三个字显示成红色，而其它文字显 "
                              " 示成黑色，那么就办不到了。"
                              "\n\n"
                              " 解决的办法很简单，我们让`CTFrameParser`支持接受 "
                              "NSAttributeString 作为参数，然后在 NSAttributeString 中设置好 "
                              " 我们想要的信息。" config:fig];
    
    self.ctView.data = textDate;
    self.ctView.height = textDate.height;
    
    
    
    
}

- (void)test2{
    /*
    
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    config.width = self.ctView.width;
    config.textColor = [UIColor blackColor];
    
    NSString *content =
    @" 对于上面的例子，我们给 CTFrameParser 增加了一个将 NSString 转 "
    " 换为 CoreTextData 的方法。"
    " 但这样的实现方式有很多局限性，因为整个内容虽然可以定制字体 "
    " 大小，颜色，行高等信息，但是却不能支持定制内容中的某一部分。"
    " 例如，如果我们只想让内容的前三个字显示成红色，而其它文字显 "
    " 示成黑色，那么就办不到了。"
    "\n\n"
    " 解决的办法很简单，我们让`CTFrameParser`支持接受 "
    "NSAttributeString 作为参数，然后在 NSAttributeString 中设置好 "
    " 我们想要的信息。";
    NSDictionary *attr = [CTFrameParser attributesWithConfig:config];
    NSMutableAttributedString *attributedString =
    [[NSMutableAttributedString alloc] initWithString:content
                                           attributes:attr];
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:[UIColor redColor]
                             range:NSMakeRange(0, 7)];
    
    CoreTextData *data = [CTFrameParser parseAttributedContent:attributedString
                                                        config:config];
    self.ctView.data = data;
    self.ctView.height = data.height;
    self.ctView.backgroundColor = [UIColor yellowColor];
     */
     
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
