//
//  GH_VIw.m
//  jiugongge
//
//  Created by ZhiYuan on 2020/4/7.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_VIw.h"

@interface GH_VIw ()

@property (nonatomic, strong)UIImageView * headerImage;

@end

@implementation GH_VIw

- (id)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.headerImage = [UIImageView new];
        self.headerImage.frame = CGRectMake(20, -60, 120, 120);
        self.headerImage.backgroundColor = [UIColor redColor];
        self.headerImage.layer.cornerRadius = 60;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hello)];
        self.headerImage.userInteractionEnabled = YES;
        [self.headerImage addGestureRecognizer:tap];
        [self addSubview:self.headerImage];
    }
    return self;
}

- (void)hello{
    NSLog(@"222");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    CGPoint newPoint = [self convertPoint:point toView:self.headerImage];
    if ([self.headerImage pointInside:newPoint withEvent:event]) {
        return self.headerImage;
    }else{
        return [super hitTest:point withEvent:event];
    }
}

@end
