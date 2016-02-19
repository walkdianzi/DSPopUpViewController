//
//  popBottomViewController.m
//  DSPopViewController
//
//  Created by dasheng on 16/2/19.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "PopBottomViewController.h"
#import "PositionBottomViewController.h"

@implementation PopBottomViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIButton *buttonOne = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    buttonOne.backgroundColor = [UIColor blackColor];
    [buttonOne setTitle:@"popBottom" forState:UIControlStateNormal];
    [buttonOne addTarget:self action:@selector(buttonOneClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonOne];
}

- (void)buttonOneClick{
    
    PositionBottomViewController *positionVC = [[PositionBottomViewController alloc] init];
    [positionVC showInViewController:self.navigationController animated:YES isMaskView:YES];
}


@end
