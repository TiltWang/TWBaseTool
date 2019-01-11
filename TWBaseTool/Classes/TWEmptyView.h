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

@property (nonatomic, assign) BOOL hasDisplayEmpty;

///重新加载的事件
@property (nonatomic, copy) TWEmptyReloadBlock reloadBlock;

///是否有点击view响应重新加载按钮事件
@property (nonatomic, assign) BOOL hasTapReloadEvent;


/**
 生成自定义视图的空页面

 @param frame 视图frame
 @param customView 自定义视图
 @param reloadBlock 按钮和点击空页面的重新加载block
 @return 返回空页面
 */
+ (instancetype)emptyCustomViewWithFrame:(CGRect)frame withCustomView:(UIView *)customView reloadBlock:(void (^)(void))reloadBlock;


/**
 生成空页面

 @param frame 视图frame
 @param image 图片
 @param tipText 提示信息
 @param reloadText 重新加载按钮文字
 @param reloadBlock 按钮和点击空页面的重新加载block
 @return 返回空页面
 */
+ (instancetype)emptyViewWithFrame:(CGRect)frame image:(UIImage *)image tipText:(NSString *)tipText reloadText:(NSString *)reloadText reloadBlock:(void (^)(void))reloadBlock;

@end
