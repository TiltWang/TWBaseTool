//
//  TWEmptyView.h
//  TWBaseTool
//
//  Created by Tilt on 2018/12/26.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TWEmptyType) {
    TWEmptyTypeCustom,    //自定义
    TWEmptyTypeError,     //错误
};

typedef void(^TWEmptyReloadBlock)(void);

@interface TWEmptyView : UIView

@property (nonatomic, assign) TWEmptyType emptyType;

@property (nonatomic, strong) UIView *emptyCustomView;

@property (nonatomic, strong) UIImageView *emptyImgView;

@property (nonatomic, strong) UILabel *emptyTipLbl;

@property (nonatomic, strong) UIButton *emptyReloadBtn;

///重新加载的事件
@property (nonatomic, copy) TWEmptyReloadBlock reloadBlock;

///是否有点击view响应重新加载按钮事件
@property (nonatomic, assign) BOOL hasTapReloadEvent;

@end
