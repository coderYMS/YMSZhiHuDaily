//
//  YMSLeftMenuTableViewCell.m
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "YMSLeftMenuTableViewCell.h"

@interface YMSLeftMenuTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIImageView *accessImage;


@end

@implementation YMSLeftMenuTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setupTitle:(NSString *)title andIsOrdered:(BOOL)isOrdered{
    _titleLab.text = title;
    _accessImage.image = [UIImage imageNamed:(isOrdered? @"left_enter":@"left_add")];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
