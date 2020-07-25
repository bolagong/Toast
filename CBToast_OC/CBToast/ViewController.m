//
//  ViewController.m
//  CBToast
//
//  Created by chang on 2018/3/28.
//  Copyright © 2018年 chang. All rights reserved.
//

#import "ViewController.h"
#import "BOViewController.h"
#import "CBToast.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat main_width = [UIScreen mainScreen].bounds.size.width;
    CGFloat main_height = [UIScreen mainScreen].bounds.size.height;

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(30, 90, main_width-30*2, 40);
    btn.tag = 1;
    btn.backgroundColor = [UIColor orangeColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:@"正在加载中" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showToastAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(30, CGRectGetMaxY(btn.frame)+15, main_width-30*2, 40);
    btn1.tag = 2;
    btn1.backgroundColor = [UIColor orangeColor];
    btn1.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn1 setTitle:@"请你核对信息之后，再从新下一个单子，然后查看一下订单号码和订单金额是否符合规定，然后就可以测试这个名字很长的啦" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(showToastAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(30, CGRectGetMaxY(btn1.frame)+15, main_width-30*2, 40);
    btn2.tag = 3;
    btn2.selected = YES;
    btn2.backgroundColor = [UIColor orangeColor];
    btn2.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn2 setTitle:@"菊花旋转" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(showToastAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(30, CGRectGetMaxY(btn2.frame)+15, main_width-30*2, 40);
    btn3.tag = 4;
    btn3.selected = YES;
    btn3.backgroundColor = [UIColor orangeColor];
    btn3.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn3 setTitle:@"菊花带消息的正在加载中" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(showToastAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    
    
    UIButton *bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bottomBtn.frame = CGRectMake(30, main_height-40-30, main_width-30*2, 40);
    bottomBtn.tag = 100;
    bottomBtn.backgroundColor = [UIColor orangeColor];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [bottomBtn setTitle:@"跳转下一页" forState:UIControlStateNormal];
    [bottomBtn addTarget:self action:@selector(showToastAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomBtn];
}

- (void)showToastAction:(UIButton *)buton
{
    switch (buton.tag) {
        case 1:
        {
            [CBToast showToastAction:buton.currentTitle];
        }
            break;
        case 2:
        {
            //根据top，bottom，center来显示位置。 时间3.0s
            [CBToast showToast:buton.currentTitle location:@"bottom" showTime:3.0];
        }
            break;
        case 3:
        {
            if (buton.selected) {
                [CBToast showToastAction];
            }else{
                [CBToast hiddenToastAction];
            }
            buton.selected = !buton.selected;
        }
            break;
        case 4:
        {
            if (buton.selected) {
                [CBToast showIndicatorToastAction:buton.currentTitle];
            }else{
                [CBToast hiddenIndicatorToastAction];
            }
            buton.selected = !buton.selected;
        }
            break;
            
        case 100:
        {
            BOViewController *bVC = [[BOViewController alloc] init];
            bVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:bVC animated:YES completion:nil];
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
