//
//  FadeOneViewController.m
//  DSPopViewController
//
//  Created by dasheng on 16/2/17.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "FadeOneViewController.h"

@implementation FadeOneViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self initObjects];
}


-(void)initObjects{
    
    /*-------一些属性的设置----------*/
    self.contentTopMargin = [[UIScreen mainScreen]bounds].size.height-200;
    self.contentFrame = CGRectMake(0, self.contentTopMargin, [[UIScreen mainScreen]bounds].size.width, 200);
    self.maskTopMargin = 0;
    
    
    /*-------内容视图-------*/
    self.contentView.backgroundColor = [UIColor whiteColor];
    UILabel  *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, [[UIScreen mainScreen]bounds].size.width - 20, 50)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"一些内容的创建";
    [self.contentView addSubview:titleLabel];
}

@end
