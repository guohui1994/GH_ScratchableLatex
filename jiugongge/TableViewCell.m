//
//  TableViewCell.m
//  jiugongge
//
//  Created by ZhiYuan on 2020/4/7.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "TableViewCell.h"


@interface TableViewCell ()

@property (nonatomic, strong)UIImageView * headerImage;//头像

@property (nonatomic, strong)UILabel * nameLable;//名字

@property (nonatomic, strong)UILabel * titleLable;//标题

@property (nonatomic, strong)UIView * imageBackGroundView;//九宫格view;

@end


@implementation TableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    [self.contentView addSubview:self.headerImage];
    [self.contentView addSubview:self.nameLable];
    [self.contentView addSubview:self.titleLable];
    [self.contentView addSubview:self.imageBackGroundView];
    [self layout];
}

- (void)layout{
    self.headerImage.sd_layout
    .leftSpaceToView(self.contentView, 25)
    .topSpaceToView(self.contentView, 15)
    .widthIs(50)
    .heightIs(50);
    
    self.nameLable.sd_layout
    .topEqualToView(self.headerImage)
    .leftSpaceToView(self.headerImage, 10)
    .rightSpaceToView(self.contentView, 20)
    .heightIs(20);
    
    self.titleLable.sd_layout
    .leftEqualToView(self.nameLable)
    .rightSpaceToView(self.contentView, 10)
    .topSpaceToView(self.nameLable, 10)
    .autoHeightRatio(0);
    
    self.imageBackGroundView.sd_layout
    .leftEqualToView(self.titleLable)
    .rightSpaceToView(self.contentView, 10)
    .topSpaceToView(self.titleLable, 10)
    .autoHeightRatio(0);

}

- (void)setDic:(NSDictionary *)dic{
    _dic = dic;
    //移除所有子视图
    [self.imageBackGroundView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _titleLable.text = dic[@"text"];
    NSNumber * imageCounts = dic[@"image"];
    int imageCount = [imageCounts intValue];
    NSMutableArray * temp = [NSMutableArray new];
    for (int i = 0; i < imageCount; i++) {
        UIImageView * image = [UIImageView new];
        image.backgroundColor = [UIColor yellowColor];
        image.sd_cornerRadius = @(10);
        image.tag = 20000847484728 + i;
        image.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [image addGestureRecognizer:tap];
        [self.imageBackGroundView addSubview:image];
        image.sd_layout
       .autoHeightRatio(1);
        [temp addObject:image];
    }
    //使用SD进行九宫格布局, 固定间距宽度自适应
    [self.imageBackGroundView setupAutoWidthFlowItems:temp withPerRowItemsCount:3 verticalMargin:5 horizontalMargin:5 verticalEdgeInset:5 horizontalEdgeInset:5];
      [self setupAutoHeightWithBottomView:self.imageBackGroundView bottomMargin:10];
}

- (void)tapAction:(UITapGestureRecognizer *)sender{  
    if (self.blcok) {
        self.blcok(sender.view.tag - 20000847484728);
    }
}


- (UIImageView *)headerImage{
    if (!_headerImage) {
        _headerImage = [UIImageView new];
        _headerImage.backgroundColor = [UIColor redColor];
        _headerImage.sd_cornerRadius = @(10);
    }
    return _headerImage;
}

- (UILabel *)nameLable{
    if (!_nameLable) {
        _nameLable = [UILabel new];
        _nameLable.textColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
        _nameLable.font = [UIFont systemFontOfSize:25];
        _nameLable.text = @"老王";
    }
    return _nameLable;
}

- (UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [UILabel new];
        _titleLable.font = [UIFont systemFontOfSize:20];
        _titleLable.numberOfLines = 0;
    }
    return _titleLable;
}

- (UIView *)imageBackGroundView{
    if (!_imageBackGroundView) {
        _imageBackGroundView = [UIView new];
    }
    return _imageBackGroundView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
