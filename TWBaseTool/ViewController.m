//
//  ViewController.m
//  TWBaseTool
//
//  Created by Tilt on 2018/11/12.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+FillBackgroundColor.h"
#import "TWBaseTool.h"
#import "UIView+Frame.h"
#import "NSAttributedString+TWExtension.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *lbl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 88, ScreenWidth - 40, 30)];
    self.lbl.numberOfLines = 0;
    [self.view addSubview:self.lbl];
    self.lbl.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self testAttributeStrHeight];
}

- (void)testAttributeStrHeight {
    NSString *content = @"tesejofjslkdjfsakas你好啊 讷讷呢那就打卡结束了阿jdfjlskajflkas你好啊 讷讷呢那就打卡结束了阿里看风景埃里克死定了房间啊圣诞节福利卡机esejokas你好啊 讷讷呢那就打卡结束了阿fjslkdjfsajdfjlskajflkas你好啊esejkas你好啊 讷讷呢那就打卡结束了阿ofjslkdjfsajdfjlkas你好啊 讷讷呢那就打卡结束了阿skajflkas你好啊kas你好啊 讷讷呢那就打卡结束了阿";
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc]initWithString:content];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = 5.0;
    [text addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14.0], NSForegroundColorAttributeName: HEXCOLOR(0x666666), NSParagraphStyleAttributeName: paragraphStyle} range:NSMakeRange(0, content.length)];
    self.lbl.attributedText = text;
    self.lbl.height = [text getAttributtedStringHeightWithMaxWidth:ScreenWidth - 40];
}


- (void)testBtn {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 88, 50, 30)];
    [btn setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn setTitle:@"test" forState:UIControlStateNormal];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
