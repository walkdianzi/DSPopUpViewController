//
//  DSPopUpViewController.m
//  DSPopViewController
//
//  Created by dasheng on 16/2/17.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "DSPopUpViewController.h"
#import "UIImage+Blur.h"
#import "UIView+frame.h"

@interface DSPopUpViewController()<UIGestureRecognizerDelegate>{
    
    UIImage     *_blurImage; //毛玻璃
}

@property (nonatomic, strong) UIView *contentView;     //内容
@property (nonatomic, strong) UIImageView *blurView;   //毛玻璃背景
@property (nonatomic, strong) UIView *maskView;        //阴影背景

@end

@implementation DSPopUpViewController

- (id)init{
    
    self = [super init];
    if (self) {
        // Custom initialization
        _contentView = [[UIView alloc] init];
        _contentView.clipsToBounds = YES;
        _contentTopMargin = 0;
        _maskTopMargin = 0;
        _animationDuration = 0.3f;
        _tintColor = [UIColor colorWithWhite:1 alpha:0.8];
        _maskView = [[UIView alloc] init];
        _maskColor = [UIColor colorWithWhite:0.0 alpha:0.6];
        _maskView.backgroundColor = _maskColor;
        _popAnimationType = PopAnimationFade;
        _position = PositionBottom;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.clipsToBounds = YES;
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)loadView {
    [super loadView];
    [self.view addSubview:self.contentView];
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    self.tapGesture.delegate = self;
    [self.view addGestureRecognizer:self.tapGesture];
}
- (void)handleTap:(UITapGestureRecognizer *)recognizer {
    
    CGPoint location = [recognizer locationInView:self.view];
    if (! CGRectContainsPoint(self.contentView.frame, location)) {
        [self dismissAnimated:YES];
    }
}

//加到父viewController里
- (void)addToParentViewController:(UIViewController *)parentViewController callingAppearanceMethods:(BOOL)callAppearanceMethods {
    
    if (self.parentViewController != nil) {
        [self removeFromParentViewControllerCallingAppearanceMethods:callAppearanceMethods];
    }
    
    if (callAppearanceMethods){
        [self beginAppearanceTransition:YES animated:NO];
    }
    [parentViewController addChildViewController:self];
    [parentViewController.view addSubview:self.view];
    [self didMoveToParentViewController:self];
    if (callAppearanceMethods) {
        [self endAppearanceTransition];
    }
}

//从父viewController里删除
- (void)removeFromParentViewControllerCallingAppearanceMethods:(BOOL)callAppearanceMethods {
    if (callAppearanceMethods) {
        [self beginAppearanceTransition:NO animated:NO];
    }
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    if (callAppearanceMethods) {
        [self endAppearanceTransition];
    }
}


#pragma mark- 显示

- (void)showInViewController:(UIViewController *)controller animated:(BOOL)animated{
    
    [self showInViewController:controller animated:animated isMaskView:NO isBlurView:NO];
}

- (void)showInViewController:(UIViewController *)controller animated:(BOOL)animated isMaskView:(BOOL)isMaskView{
    
    [self showInViewController:controller animated:animated isMaskView:isMaskView isBlurView:NO];
}

- (void)showInViewController:(UIViewController *)controller animated:(BOOL)animated isBlurView:(BOOL)isBlurView{
    
    [self showInViewController:controller animated:animated isMaskView:NO isBlurView:isBlurView];
}

- (void)showInViewController:(UIViewController *)controller animated:(BOOL)animated isMaskView:(BOOL)isMaskView isBlurView:(BOOL)isBlurView{
    
    _isShow = YES;
    _blurImage = [controller.view screenshot];
    _blurImage = [_blurImage applyBlurWithRadius:40 tintColor:self.tintColor saturationDeltaFactor:1.8 maskImage:nil];
    
    [self addToParentViewController:controller callingAppearanceMethods:YES];
    self.view.frame = controller.view.bounds;
    
    switch (_popAnimationType) {
        case PopAnimationPosition:
            [self showPositionIsMaskView:isMaskView isBlurView:isBlurView isAnimation:animated];
            break;
        case PopAnimationFade:
            [self showFadeIsMaskView:isMaskView isBlurView:isBlurView isAnimation:animated];
            break;
        default:
            break;
    }
}

//渐现动画
- (void)showFadeIsMaskView:(BOOL)isMaskView isBlurView:(BOOL)isBlurView isAnimation:(BOOL)isAnimation{
    
    if (isMaskView) {
        CGRect maskFrame;
        maskFrame = CGRectMake(0, _maskTopMargin, self.view.bounds.size.width, [[UIScreen mainScreen]bounds].size.height - _maskTopMargin);
        self.maskView.frame = maskFrame;
        [self.view insertSubview:self.maskView belowSubview:self.contentView];
    }
    
    if (isBlurView) {
        
        self.blurView = [[UIImageView alloc] initWithImage:_blurImage];
        self.blurView.frame = _contentFrame;
        self.blurView.contentMode = UIViewContentModeCenter;
        self.blurView.clipsToBounds = YES;
        [self.blurView.layer setCornerRadius:self.contentCornerRadius];
        [self.view insertSubview:self.blurView belowSubview:self.contentView];                                //特殊效果毛玻璃的背景
    }
    
    self.maskView.backgroundColor = _maskColor;
    self.contentView.frame = _contentFrame;
    [self.contentView.layer setCornerRadius:self.contentCornerRadius];
    
    if (isAnimation) {
        self.maskView.alpha = 0;
        self.blurView.alpha = 0;
        self.contentView.alpha = 0;
        [UIView animateWithDuration:self.animationDuration animations:^{
            self.maskView.alpha = 1;
            self.blurView.alpha = 1;
            self.contentView.alpha = 1;
        }];
    }else{
        self.maskView.alpha = 1;
        self.blurView.alpha = 1;
        self.contentView.alpha = 1;
    }
}

- (void)showPositionIsMaskView:(BOOL)isMaskView isBlurView:(BOOL)isBlurView isAnimation:(BOOL)isAnimation{
    
    
}

#pragma mark- 消失

- (void)dismiss{
    [self dismissAnimated:YES completion:nil];
}

- (void)dismissAnimated:(BOOL)animated{
    [self dismissAnimated:animated completion:nil];
}

- (void)dismissAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion{
    
    _isShow = NO;
    [self hideFadeIsAnimation:YES completion:completion];
}

//渐隐动画
- (void)hideFadeIsAnimation:(BOOL)isAnimation completion:(void (^)(BOOL finished))completion{
    
    void (^completionBlock)(BOOL) = ^(BOOL finished){
        [self removeFromParentViewControllerCallingAppearanceMethods:YES];
        if (completion) {
            completion(finished);
        }
    };
    
    if (isAnimation) {
        
        void (^animations)() = ^{
            self.contentView.alpha = 0;
            self.maskView.alpha = 0;
            self.blurView.alpha = 0;
        };
        [UIView animateWithDuration:self.animationDuration
                              delay:0
                            options:kNilOptions
                         animations:animations
                         completion:completionBlock];
        
    }else{
        self.contentView.alpha = 0;
        self.maskView.alpha = 0;
        self.blurView.alpha = 0;
        completionBlock(YES);
    }
}

//位置动画
- (void)hidePositionIsAnimation:(BOOL)isAnimation completion:(void (^)(BOOL finished))completion{
    
    
}

#pragma mark UIGestureRecognizerDelegate

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]||[NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellEditControl"]||touch.view.tag==-99) {
        return NO;
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
