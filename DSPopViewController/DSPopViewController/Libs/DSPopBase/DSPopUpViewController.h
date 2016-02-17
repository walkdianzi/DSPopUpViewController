//
//  DSPopUpViewController.h
//  DSPopViewController
//
//  Created by dasheng on 16/2/17.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import <UIKit/UIKit.h>

//弹出方向
typedef enum{
    PositionBottom ,
    PositionMiddle ,
    PositionTop
}PositionEnum;

//弹出动画
typedef enum{
    PopAnimationFade ,
    PopAnimationPosition,
}PopAnimationType;


@interface DSPopUpViewController : UIViewController

/**
 *  内容的位置大小
 */
@property (nonatomic, assign)CGRect contentFrame;

/**
 *  内容离顶部的距离(整个屏幕的最顶部screen)
 */
@property (nonatomic, assign)CGFloat contentTopMargin;

/**
 *  内容view
 */
@property (nonatomic, strong, readonly) UIView *contentView;


/**
 *  内容视图的圆角
 */
@property (nonatomic, assign)CGFloat    contentCornerRadius;


/**
 *  背景离顶部的距离(整个屏幕的最顶部screen) default 0
 */
@property (nonatomic, assign)CGFloat maskTopMargin;


/**
 *  是否为显示状态
 */
@property (nonatomic, assign)BOOL     isShow;

/**
 *  弹出的方向
 */
@property (nonatomic, assign)PositionEnum position;

/**
 *  动画效果
 */
@property (nonatomic, assign)PopAnimationType popAnimationType;


/**
 *  动画时间 Default 0.25
 */
@property (nonatomic, assign) CGFloat animationDuration;


/**
 *  毛玻璃的颜色参数
 *  Default white: 1, alpha: 0.8
 */
@property (nonatomic, strong) UIColor *tintColor;

/**
 *  阴影遮罩颜色
 */
@property (nonatomic, strong)UIColor  *maskColor;

@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;


- (void)showInViewController:(UIViewController *)controller animated:(BOOL)animated;

- (void)showInViewController:(UIViewController *)controller animated:(BOOL)animated isMaskView:(BOOL)isMaskView;

- (void)showInViewController:(UIViewController *)controller animated:(BOOL)animated isBlurView:(BOOL)isBlurView;

/**
 *  显示
 *
 *  @param controller 现在在哪个controller
 *  @param position   跳出的位置
 *  @param animated   是否有动画
 *  @param isMaskView 是否阴影效果
 *  @param isBlurView 是否毛玻璃效果
 */
- (void)showInViewController:(UIViewController *)controller animated:(BOOL)animated isMaskView:(BOOL)isMaskView isBlurView:(BOOL)isBlurView;


- (void)dismiss;
- (void)dismissAnimated:(BOOL)animated;
- (void)dismissAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion;

- (void)handleTap:(UITapGestureRecognizer *)recognizer;

@end
