//
//  PopTopViewController.m
//  DSPopViewController
//
//  Created by dasheng on 16/2/19.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "PopTopViewController.h"
#import "PositionTopViewController.h"

@implementation PopTopViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIButton *buttonOne = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    buttonOne.backgroundColor = [UIColor blackColor];
    [buttonOne setTitle:@"popTop" forState:UIControlStateNormal];
    [buttonOne addTarget:self action:@selector(buttonOneClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonOne];
}

- (void)buttonOneClick{
    
    PositionTopViewController *positionVC = [[PositionTopViewController alloc] init];
    [positionVC showInViewController:self.navigationController animated:YES isMaskView:YES];
}

@end
