//
//  YMSLaunchViewController.m
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "YMSLaunchViewController.h"
#import "YMSLaunchRequest.h"
#import <UIImageView+WebCache.h>
#import "YMSHomeViewController.h"
#import "YMSLeftDrawerViewController.h"
#import <MMDrawerController.h>
#import <MMDrawerVisualState.h>

static const CGFloat kAnimationDuration = 3.0;
static const CGFloat kPreAnimationTime = 1.0;
static const CGFloat kImageBiggerScale = 1.2;

static const CGFloat kLeftVCScale = 0.6;

@interface YMSLaunchViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *adImage;
@property (weak, nonatomic) IBOutlet UILabel *rightLab;

@end

@implementation YMSLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self takeData];
    
}

- (void)takeData{
    [YMSLaunchRequest getLaunchImageWithSuccess:^(YMSLaunchModel *launchModel) {
        [_adImage sd_setImageWithURL:[NSURL URLWithString:launchModel.img]];
        _rightLab.text = launchModel.text;
        
        [self beginAnimation];
        
    }];
}

- (void)beginAnimation{

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kPreAnimationTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:kAnimationDuration animations:^{
            _adImage.transform = CGAffineTransformMakeScale(kImageBiggerScale, kImageBiggerScale);
        } completion:^(BOOL finished) {
            [self showHomePage];
        }];
    });
    
}


- (void)showHomePage{
    YMSHomeViewController *homeVC = [[YMSHomeViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    YMSLeftDrawerViewController *leftVC =[[YMSLeftDrawerViewController alloc] init];
    
    MMDrawerController *drawer = [[MMDrawerController alloc] initWithCenterViewController:navi leftDrawerViewController:leftVC];
    
    drawer.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    drawer.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    drawer.showsShadow = NO;
    drawer.maximumLeftDrawerWidth = kScreenWidth * kLeftVCScale ;
    [drawer setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
        MMDrawerControllerDrawerVisualStateBlock block = [MMDrawerVisualState slideVisualStateBlock];
        !block?:block(drawerController,drawerSide,percentVisible);
    }];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = drawer;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
