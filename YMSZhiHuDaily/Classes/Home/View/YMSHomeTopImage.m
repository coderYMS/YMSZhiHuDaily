//
//  YMSHomeTopImage.m
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "YMSHomeTopImage.h"
#import <UIImageView+WebCache.h>

static const CGFloat kTitleLabMargin = 12;
static const CGFloat kTitleFont = 21;
static const CGFloat kBottomLab_H = 30;
static const CGFloat kBottomFont = 8;
//static const CGFloat kTextLabMargin = 12;

@interface YMSHomeTopImage ()

@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UILabel *titleLab;
@property (nonatomic,weak) UILabel *fromLab;

@end

@implementation YMSHomeTopImage

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        _image = image;
        [self addSubview:image];
        
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(kTitleLabMargin, CGRectGetHeight(frame) - kBottomLab_H - kTitleFont * 2, kScreenWidth - kTitleLabMargin * 2, kTitleFont * 2)];
        titleLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:kTitleFont];
        titleLab.textColor = [UIColor whiteColor];
        _titleLab = titleLab;
        [self addSubview:titleLab];
        
        UILabel *fromLab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame) - kBottomLab_H, kScreenWidth - kTitleLabMargin, kBottomLab_H)];
        fromLab.text = @"来源：《冰与火之歌》";
        fromLab.textAlignment = NSTextAlignmentRight;
        fromLab.font = [UIFont systemFontOfSize:kBottomFont];
        fromLab.textColor = UIColorFromRGB(0xC9C2C5);
        _fromLab = fromLab;
        [self addSubview:fromLab];
    }
    return self;
}

- (void)createWithTitle:(NSString *)title andImageURL:(NSString *)url {
    _titleLab.text = title;
    _titleLab.numberOfLines = 0;
    [_titleLab sizeToFit];
    [_image sd_setImageWithURL:[NSURL URLWithString:url]];
}

@end
