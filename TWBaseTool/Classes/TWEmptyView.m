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

+ (instancetype)emptyCustomViewWithFrame:(CGRect)frame withCustomView:(UIView *)customView reloadBlock:(void (^)(void))reloadBlock {
    TWEmptyView *emptyView = [[TWEmptyView alloc] initWithFrame:frame];
    if (customView) {
        emptyView.emptyCustomView = customView;
    } else {
        emptyView.emptyCustomView.hidden = YES;
    }
    emptyView.emptyType = TWEmptyTypeCustom;
    if (reloadBlock) {
        emptyView.hasTapReloadEvent = YES;
        emptyView.reloadBlock = reloadBlock;
    } else {
        emptyView.hasTapReloadEvent = NO;
    }
    emptyView.hasDisplayEmpty = NO;
    return emptyView;
}

+ (instancetype)emptyViewWithFrame:(CGRect)frame image:(UIImage *)image tipText:(NSString *)tipText reloadText:(NSString *)reloadText reloadBlock:(void (^)(void))reloadBlock {
    TWEmptyView *emptyView = [[TWEmptyView alloc] initWithFrame:frame];
    if (image) {
        emptyView.emptyImgView.image = image;
    } else {
        emptyView.emptyImgView.hidden = YES;
    }
    if (tipText) {
        emptyView.emptyTipLbl.text = tipText;
    } else {
        emptyView.emptyTipLbl.hidden = YES;
    }
    if (reloadText) {
        [emptyView.emptyReloadBtn setTitle:reloadText forState:UIControlStateNormal];
    } else {
        emptyView.emptyReloadBtn.hidden = YES;
    }
    emptyView.emptyType = TWEmptyTypeError;
    if (reloadBlock) {
        emptyView.hasTapReloadEvent = YES;
        emptyView.reloadBlock = reloadBlock;
    } else {
        emptyView.hasTapReloadEvent = NO;
    }
    emptyView.hasDisplayEmpty = NO;
    return emptyView;
}

- (void)emptyReloadBtnClick {
    if (_reloadBlock) {
        _reloadBlock();
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.layer.masksToBounds = YES;
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
            break;
        }
        case TWEmptyTypeError: {
            [self addSubview:self.emptyImgView];
            [self addSubview:self.emptyTipLbl];
            [self addSubview:self.emptyReloadBtn];
            [self.emptyImgView sizeToFit];
            [self.emptyTipLbl sizeToFit];
            [self.emptyReloadBtn sizeToFit];
            break;
        }
    }
}

- (void)layoutSubviews {
    switch (self.emptyType) {
        case TWEmptyTypeCustom: {
            self.emptyCustomView.centerX = self.width / 2.0;
            self.emptyCustomView.centerY = self.height / 2.0;
            break;
        }
        case TWEmptyTypeError: {
            self.emptyImgView.centerX = self.width / 2.0;
            self.emptyImgView.centerY = self.height / 2.0 - 50;
            self.emptyImgView.size = self.emptyImgView.size;
            self.emptyTipLbl.centerX = self.width / 2.0;
            self.emptyTipLbl.y = self.emptyImgView.y + self.emptyImgView.height + 10;
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
        _emptyTipLbl.font = [UIFont systemFontOfSize:15.0];
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
