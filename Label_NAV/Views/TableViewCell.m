//
//  TableViewCell.m
//  仿微博界面-YYKit
//
//  Created by zjwang on 16/7/19.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "TableViewCell.h"
#import <TTTAttributedLabel.h>
#define s_w [UIScreen mainScreen].bounds.size.width
#define s_h [UIScreen mainScreen].bounds.size.height
@interface TableViewCell ()<TTTAttributedLabelDelegate>
@property (nonatomic, strong) TTTAttributedLabel *summaryLabel;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 8.0;
        
        // label 1
        TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(5, 5, s_w, 30)];
        [self.contentView addSubview:label];
        
        NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"1. summerxx"
                                                                        attributes:@{
                                                                                     (id)kCTForegroundColorAttributeName : (id)[UIColor redColor].CGColor,
                                                                                     NSFontAttributeName : [UIFont boldSystemFontOfSize:16],
                                                                                     NSKernAttributeName : [NSNull null],
                                                                                     (id)kTTTBackgroundFillColorAttributeName : (id)[UIColor greenColor].CGColor
                                                                                     }];
        label.text = attString;
        [self.contentView addSubview:label];
        
        
        // lebal 2
        TTTAttributedLabel *label2 = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(5, 40, s_w - 10, 30)];
        label2.font = [UIFont systemFontOfSize:14];
        label2.textColor = [UIColor darkGrayColor];
        // 位置
        label2.textAlignment = TTTAttributedLabelVerticalAlignmentTop;
        label2.numberOfLines = 0;
        
        NSString *text = @"2. 夏天然后不定期会写一些blog";
        [label2 setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"不定期" options:NSCaseInsensitiveSearch];
            NSRange strikeRange = [[mutableAttributedString string] rangeOfString:@"blog" options:NSCaseInsensitiveSearch];
            UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:10];
            CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
            
            if (font) {
                // 改变字体
                [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
                // 画线
                [mutableAttributedString addAttribute:kTTTStrikeOutAttributeName value:@YES range:strikeRange];
                CFRelease(font);
                
            }
            
            return mutableAttributedString;
        }];
        [self.contentView addSubview:label2];
        
        // 初始化
        TTTAttributedLabel *label3 = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(5, 75, s_w - 10, 68)];
        label3.numberOfLines = 0;
        // 自动检测链接标签文本
        label3.enabledTextCheckingTypes = NSTextCheckingTypeLink;
        // 指定代理人
        label3.delegate = self;
        // 自动检测URL
        label3.text = @"3. My GitHub |- 真是有意思的效果 -| http://summerxx.com |- 哈哈哈哈哈 -| 155 8245 6952";
        // 给文字添加链接
        NSRange range = [label3.text rangeOfString:@"My GitHub"];
        [label3 addLinkToURL:[NSURL URLWithString:@"https://github.com/Zhangjingwang1993"] withRange:range];
        NSRange rangePhoneNumer = [label3.text rangeOfString:@"155 8245 6952"];
        [label3 addLinkToPhoneNumber:@"155 8245 6952" withRange:rangePhoneNumer];
        [self.contentView addSubview:label3];

        
    }
    return self;
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 10;//这里间距为10，可以根据自己的情况调整
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 2 * frame.origin.x;
    [super setFrame:frame];
}
- (void)attributedLabel:(TTTAttributedLabel *)label
   didSelectLinkWithURL:(NSURL *)url
{
    [[[UIAlertView alloc] initWithTitle:@"点击URL"
                                message:[NSString stringWithFormat:@"点击成功 %@", url]
                               delegate:nil
                      cancelButtonTitle:@"cancel"
                      otherButtonTitles:nil] show];
}

- (void)attributedLabel:(__unused TTTAttributedLabel *)label didLongPressLinkWithURL:(__unused NSURL *)url atPoint:(__unused CGPoint)point {
    [[[UIAlertView alloc] initWithTitle:@"你长按URL"
                                message:[NSString stringWithFormat:@"长按成功 %@", url]
                               delegate:nil
                      cancelButtonTitle:@"cancel"
                      otherButtonTitles:nil] show];
}

- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithPhoneNumber:(NSString *)phoneNumber
{
    [[[UIAlertView alloc] initWithTitle:@"你点击的是电话号码"
                                message:[NSString stringWithFormat:@"点击成功 %@", phoneNumber]
                               delegate:nil
                      cancelButtonTitle:@"cancel"
                      otherButtonTitles:nil] show];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
