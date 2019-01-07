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
#import "TWEmptyView.h"
#import "TWLoadingView.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *lbl;
@property (nonatomic, strong) TWEmptyView *emptyView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 88, ScreenWidth - 40, 30)];
    self.lbl.numberOfLines = 0;
    [self.view addSubview:self.lbl];
    self.lbl.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    [self testBtn];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
////    [self testAttributeStrHeight];
////    [self showEmptyView];
//    [self showCustomEmptyView];
//}

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
    [btn addTarget:self action:@selector(testBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)testBtnClick {
//    [self showCustomEmptyView];
//    [self showEmptyView];
    [self testLoading];
}

- (void)testLoading {
//    TWLoadingView *loadingView = [TWLoadingView loadingViewWithFrame:CGRectMake(0, 200, 150, 150) circleColor:[UIColor greenColor] circleWidth:50.0 circleBorderWidth:3.0 withTipText:@"321" tipFont:[UIFont systemFontOfSize:20.0] tipColor:[UIColor redColor]];
//    TWLoadingView *loadingView = [TWLoadingView loadingViewDefaultWithFrame:CGRectMake(0, 200, 150, 150)];
    TWLoadingView *loadingView = [TWLoadingView loadingViewWithFrame:CGRectMake(0, 200, 150, 150) circleBgColor:HEXACOLOR(0xffffff, 0.5) circleColor:nil circleSideColor:nil circleWidth:50.0 circleBorderWidth:0.0 withTipText:@"加载中..." tipFont:nil tipColor:nil];
    loadingView.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    [self.view addSubview:loadingView];
}

- (void)showEmptyView {
    TWEmptyView *view = [[TWEmptyView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    view.emptyImgView.frame = CGRectMake(0, 0, 100, 100);
    view.emptyImgView.image = [UIImage imageNamed:@"empty"];
    view.emptyImgView.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    view.emptyTipLbl.text = @"12233343443";
    [view.emptyReloadBtn setTitleColor:[UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0] forState:UIControlStateNormal];
    view.emptyType = TWEmptyTypeError;
    view.hasTapReloadEvent = YES;
    [self.view addSubview:view];
}
- (void)showCustomEmptyView {
//    UIView *cView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, 200, 200)];
//    cView.backgroundColor = [UIColor redColor];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"empty"]];
    TWEmptyView *view = [[TWEmptyView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.emptyCustomView = imgView;
//    view.emptyCustomView = cView;
    view.emptyType = TWEmptyTypeCustom;
    view.hasTapReloadEvent = YES;
    TW_WeakSelf
    view.reloadBlock = ^{
        TW_StrongSelf
        [self reloadAction];
    };
    self.emptyView = view;
    [self.view addSubview:view];
}

- (void)reloadAction {
    self.lbl.text = @"123413";
    [self.emptyView removeFromSuperview];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
