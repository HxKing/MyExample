//
//  KKHomeCell.m
//  ZhiHuDemo
//
//  Created by 王亚康 on 16/5/4.
//  Copyright © 2016年 王亚康. All rights reserved.
//

#import "KKHomeCell.h"
#import "KKNews.h"
#import <UIImageView+WebCache.h>

@interface KKHomeCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


/** 图片 */
@property (nonatomic, strong) CALayer *iconImg;

/** 文字 标题 */
@property (nonatomic, strong) CATextLayer *nameLb;

/** 是否多图 */
@property (nonatomic, strong) CALayer *duoPic;

@end


@implementation KKHomeCell

+ (instancetype)homeCell:(UITableView *)table{
    static NSString *ID = @"homeCell";
    KKHomeCell *cell = [table dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[KKHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CALayer *iconImg = [[CALayer alloc] init];
        self.iconImg = iconImg;
        iconImg.contents = (id)[UIImage imageNamed:@"Dark_Account_Avatar"].CGImage;
        [self.contentView.layer addSublayer:iconImg];
        
        
        CATextLayer *nameLabel = [[CATextLayer alloc] init];
        self.nameLb = nameLabel;
        nameLabel.wrapped = YES;
        nameLabel.fontSize = 17;
        nameLabel.contentsScale = [UIScreen mainScreen].scale;
        nameLabel.foregroundColor = [UIColor blackColor].CGColor;
        [self.contentView.layer addSublayer:nameLabel];
        
        CALayer *duoPic = [[CALayer alloc] init];
        self.duoPic = duoPic;
        duoPic.contents = (id)[UIImage imageNamed:@"Home_Morepic"].CGImage;
        duoPic.hidden = YES;
        [self.contentView.layer addSublayer:duoPic];
        
        
        self.iconImg.frame = CGRectMake(kScreenWidth - 90, 8, 80, 80 - 2*8);
        self.duoPic.frame = CGRectMake(CGRectGetMaxX(iconImg.frame) - 32, CGRectGetMaxY(iconImg.frame) - 14, 32, 14);
        self.nameLb.frame = CGRectMake(10, 8, kScreenWidth - 30 - 80,80 - 2*8);

        
        
    }
    return self;
}

+ (KKHomeCell *)homeCell{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    
}

- (void)setNews:(KKNews *)news{
    _news = news;
    
    self.nameLb.string = news.title;
    
    if (news.isMultipic) {
        self.duoPic.hidden = NO;
    }else{
        self.duoPic.hidden = YES;
    }

    SDWebImageManager *manger = [SDWebImageManager sharedManager];
    [manger downloadImageWithURL:[NSURL URLWithString:[news.images firstObject]] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        self.iconImg.contents = (id)image.CGImage;
    }];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
