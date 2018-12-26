//
//  TWEmptyView.m
//  TWBaseTool
//
//  Created by Tilt on 2018/12/26.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import "TWEmptyView.h"
#import "UIView+Frame.h"

@implementation TWEmptyView

- (void)emptyReloadBtnClick {
    if (_reloadBlock) {
        _reloadBlock();
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setHasTapReloadEvent:(BOOL)hasTapReloadEvent {
    _hasTapReloadEvent = hasTapReloadEvent;
    if (hasTapReloadEvent) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(emptyReloadBtnClick)];
        [self addGestureRecognizer:tap];
    }
}
- (void)setEmptyType:(TWEmptyType)emptyType {
    _emptyType = emptyType;
    [self setupUIWithType:emptyType];
}

- (void)setupUIWithType:(TWEmptyType)emptyType {
    switch (emptyType) {
        case TWEmptyTypeCustom: {
            [self addSubview:self.emptyCustomView];
            self.emptyCustomView.centerX = self.width / 2.0;
            self.emptyCustomView.centerY = self.height / 2.0;
            break;
        }
        case TWEmptyTypeError: {
            [self addSubview:self.emptyImgView];
            [self addSubview:self.emptyTipLbl];
            [self addSubview:self.emptyReloadBtn];
            [self.emptyImgView sizeToFit];
            self.emptyImgView.centerX = self.width / 2.0;
            self.emptyImgView.centerY = self.height / 2.0 - 50;
            self.emptyImgView.size = self.emptyImgView.size;
            [self.emptyTipLbl sizeToFit];
            self.emptyTipLbl.centerX = self.width / 2.0;
            self.emptyTipLbl.y = self.emptyImgView.y + self.emptyImgView.height + 10;
            [self.emptyReloadBtn sizeToFit];
            self.emptyReloadBtn.centerX = self.width / 2.0;
            self.emptyReloadBtn.y = self.emptyTipLbl.y + self.emptyTipLbl.height + 10;
            break;
        }
    }
}


- (UIImageView *)emptyImgView {
    if (!_emptyImgView) {
        _emptyImgView = [[UIImageView alloc] init];
    }
    return _emptyImgView;
}

- (UILabel *)emptyTipLbl {
    if (!_emptyTipLbl) {
        _emptyTipLbl = [[UILabel alloc] init];
    }
    return _emptyTipLbl;
}

- (UIButton *)emptyReloadBtn {
    if (!_emptyReloadBtn) {
        _emptyReloadBtn = [[UIButton alloc] init];
        [_emptyReloadBtn setTitle:@"reload" forState:UIControlStateNormal];
        [_emptyReloadBtn addTarget:self action:@selector(emptyReloadBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _emptyReloadBtn;
}

- (UIView *)emptyCustomView {
    if (!_emptyCustomView) {
        _emptyCustomView = [[UIView alloc] init];
    }
    return _emptyCustomView;
}

@end
