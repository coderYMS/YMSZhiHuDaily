//
//  YMSHomeScrollView.m
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "YMSHomeScrollView.h"
#import "YMSHomeTopImage.h"
#import "YMSHomeStoriesModel.h"
#import "YMSHomeTopStoryModel.h"

static const CGFloat kPageCtr_H = 30;
static const CGFloat kTimerDuration = 2;

@interface YMSHomeScrollView ()<UIScrollViewDelegate>

@property (nonatomic,weak) UIScrollView *scroll;
@property (nonatomic,weak) UIPageControl *pageC;

@property (nonatomic,strong) NSTimer *timer;

@end

@implementation YMSHomeScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:frame];
        scroll.showsHorizontalScrollIndicator = NO;
        scroll.delegate = self;
        scroll.pagingEnabled = YES;
        _scroll = scroll;
        [self addSubview:scroll];
        
        UIPageControl *pageC = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame) - kPageCtr_H, kScreenWidth, kPageCtr_H)];
        _pageC = pageC;
        [self addSubview:pageC];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
        [self addGestureRecognizer:pan];
    }
    return self;
}

- (void)createScrollWithStories:(NSArray *)modelArr {
    _pageC.numberOfPages = modelArr.count;
    _scroll.contentSize = CGSizeMake(kScreenWidth * modelArr.count, 0);
    for (int i = 0; i < modelArr.count; i++) {
        YMSHomeTopStoryModel *model = modelArr[i];
        YMSHomeTopImage *image = [[YMSHomeTopImage alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, CGRectGetHeight(self.frame))];
        [image createWithTitle:model.title andImageURL:model.image];
        [_scroll addSubview:image];
    }
    
    !_timer ? : [self removeTimer];
    [self addTimer];
}

- (void)click {
    
}

- (void)changeImage {
    
}

- (void)removeTimer {
    _timer = [NSTimer timerWithTimeInterval:kTimerDuration target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
}
- (void)addTimer {
    [_timer invalidate];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    
    [self addTimer];
}

@end
