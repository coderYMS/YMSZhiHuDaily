//
//  YMSHomeCell.m
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "YMSHomeCell.h"
#import <UIImageView+WebCache.h>

@interface YMSHomeCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIImageView *moreImg;


@end

@implementation YMSHomeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)createCell:(YMSHomeStoriesModel *)model {
    _titleLab.text = model.title;
    [_image sd_setImageWithURL:[NSURL URLWithString:[model.images firstObject]] placeholderImage:[UIImage imageNamed:@"home_image_placeholder"]];
    _moreImg.hidden = !model.multipic;
}

@end
