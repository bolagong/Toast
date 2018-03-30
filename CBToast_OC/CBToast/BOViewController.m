//
//  BOViewController.m
//  CBToast
//
//  Created by chang on 2018/3/29.
//  Copyright © 2018年 chang. All rights reserved.
//

#import "BOViewController.h"
#import "CBToast.h"

@interface BOViewController ()

@end

@implementation BOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat main_width = [UIScreen mainScreen].bounds.size.width;
    CGFloat main_height = [UIScreen mainScreen].bounds.size.height;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(30, 90, main_width-30*2, 40);
    btn.tag = 1;
    btn.selected = YES;
    btn.backgroundColor = [UIColor orangeColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:@"正在加载中" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showToastAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    UIButton *bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bottomBtn.frame = CGRectMake(30, main_height-40-30, main_width-30*2, 40);
    bottomBtn.tag = 100;
    bottomBtn.backgroundColor = [UIColor orangeColor];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [bottomBtn setTitle:@"返回上一页" forState:UIControlStateNormal];
    [bottomBtn addTarget:self action:@selector(showToastAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomBtn];
}

- (void)showToastAction:(UIButton *)sender
{
    switch (sender.tag) {
        case 1:
        {
            if (sender.selected) {
                [CBToast showIndicatorToastAction:sender.currentTitle];
            }else{
                [CBToast hiddenIndicatorToastAction];
            }
            sender.selected = !sender.selected;
        }
            break;
            
        case 100:
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
