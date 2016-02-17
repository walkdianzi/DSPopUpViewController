//
//  PopFadeViewController.m
//  DSPopViewController
//
//  Created by dasheng on 16/2/17.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "PopFadeViewController.h"
#import "FadeOneViewController.h"

@implementation PopFadeViewController


- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIButton *buttonOne = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    buttonOne.backgroundColor = [UIColor blackColor];
    [buttonOne setTitle:@"fadeOne" forState:UIControlStateNormal];
    [buttonOne addTarget:self action:@selector(buttonOneClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonOne];
}

- (void)buttonOneClick{
    
    FadeOneViewController *fadeOneVC = [[FadeOneViewController alloc] init];
    [fadeOneVC showInViewController:self.navigationController animated:YES isMaskView:YES];
}

@end
