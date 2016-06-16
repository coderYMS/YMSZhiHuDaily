//
//  YMSHomeViewController.m
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "YMSHomeViewController.h"

@interface YMSHomeViewController ()

@end

@implementation YMSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"知乎日报";
    
    UIView *whiteView =[[UIView alloc] initWithFrame:kScreenBounds];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
