//
//  YMSLeftDrawerViewController.m
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "YMSLeftDrawerViewController.h"
#import "YMSLeftMenuTableViewCell.h"

static NSString * const cellIdentifier = @"YMSLeftMenuTableViewCell";

@interface YMSLeftDrawerViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *tableDataArr;
}

@property (weak, nonatomic) IBOutlet UIImageView *headerImage;

@property (weak, nonatomic) IBOutlet UITableView *table;


@end

@implementation YMSLeftDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    tableDataArr = @[@"用户推荐日报",@"日常心理学",@"电影日报",@"不许无聊",@"设计日报",@"大公司日报",@"财经日报",@"互联网安全",@"开始游戏",@"音乐日报",@"动漫日报",@"体育日报"];
    
    _headerImage.layer.cornerRadius = CGRectGetWidth(_headerImage.bounds)/2;
    _headerImage.layer.masksToBounds = YES;
    
    _table.backgroundColor = [UIColor clearColor];
    [_table registerNib:[UINib nibWithNibName:@"YMSLeftMenuTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableDataArr.count + 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"YMSLeftHomeCell" owner:self options:nil] lastObject];
        
        return cell;
    }else{
        YMSLeftMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        
        [cell setupTitle:tableDataArr[indexPath.row - 1] andIsOrdered:NO];
        
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
