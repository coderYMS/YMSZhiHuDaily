//
//  YMSHomeViewController.m
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "YMSHomeViewController.h"
#import "YMSHomeCell.h"
#import "YMSHomeRequest.h"
#import "YMSHomeScrollView.h"

static const CGFloat kMenuBtnMargin = 12;
static const CGFloat kMenuBtn_W = 20;
static NSString * const kHomeCellID = @"kHomeCellID";
static const CGFloat kCell_H = 93;
static const CGFloat kScroll_H = 220;

@interface YMSHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_stories;
    NSArray *_top_stories;
}

@property (nonatomic,weak) UITableView *mainTable;

@end

@implementation YMSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"知乎日报";
    self.navigationController.navigationBarHidden = YES;
    SET_WHITE_STATUSBAR
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self takeData];
    [self createView];
}

- (void)createView {
    UITableView *mainTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [mainTable registerNib:[UINib nibWithNibName:@"YMSHomeCell" bundle:nil] forCellReuseIdentifier:kHomeCellID];
    mainTable.delegate = self;
    mainTable.dataSource = self;
    mainTable.showsHorizontalScrollIndicator = NO;
    mainTable.separatorColor = UIColorFromRGB(0xF8F6FA);
    _mainTable = mainTable;
    [self.view addSubview:mainTable];
    
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(kMenuBtnMargin, kMenuBtnMargin + 20, kMenuBtn_W, kMenuBtn_W);
    [menuBtn setImage:[UIImage imageNamed:@"home_menuBtn"] forState:UIControlStateNormal];
    [menuBtn setImage:[UIImage imageNamed:@"home_menuBtn_h"] forState:UIControlStateHighlighted];
    [self.view addSubview:menuBtn];
    
}

- (void)takeData{
    [YMSHomeRequest getLatestNewsWithSuccess:^(YMSLatestNewsModel *result) {
        _stories = [[NSArray alloc] initWithArray:result.stories];
        _top_stories = [[NSArray alloc] initWithArray:result.top_stories];
        [_mainTable reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _stories.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return kScroll_H;
    }
    return kCell_H;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"notReuse"];
        YMSHomeScrollView *scroll = [[YMSHomeScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScroll_H)];
        [scroll createScrollWithStories:_top_stories];
        [cell.contentView addSubview:scroll];
        return cell;
    }else{
        YMSHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:kHomeCellID forIndexPath:indexPath];
        [cell createCell:_stories[indexPath.row]];
        return cell;
    }

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
