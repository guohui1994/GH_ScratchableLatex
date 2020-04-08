//
//  ViewController.m
//  jiugongge
//
//  Created by ZhiYuan on 2020/4/7.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "GH_VIw.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView * tableView;

@property (nonatomic, copy)NSArray * dataSource;
@end

@implementation ViewController

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    GH_VIw * v = [[GH_VIw alloc]initWithFrame:CGRectMake(20, 300, 400, 300)];
    v.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:v];
    
    [self creatUI];
    self.dataSource = @[@{@"text":@"不要为小事遮住视线，我们还有更大的世界。",@"image":@(0)},
                        @{@"text":@"不与跟生命有关的人耗着，少与生命无关的事耗。",@"image":@(1)},
                        @{@"text":@"没有不进步的人生，只有不进取的人！",@"image":@(2)},
                        @{@"text":@"在成功的道路上，激情是需要的，志向是可贵的，但更重要的是那毫无情趣的近乎平常的坚守的毅力和勇气。",@"image":@(3)},
                        @{@"text":@"在成功的道路上，激情是需要的，志向是可贵的，但更重要的是那毫无情趣的近乎平常的坚守的毅力和勇气。",@"image":@(4)},
                        @{@"text":@"不要为小事遮住视线，我们还有更大的世界。不要为小事遮住视线，我们还有更大的世界。不要为小事遮住视线，我们还有更大的世界。不要为小事遮住视线，我们还有更大的世界。不要为小事遮住视线，我们还有更大的世界。不要为小事遮住视线，我们还有更大的世界。",@"image":@(6)},
                        @{@"text":@"当我觉得我倒霉了，我就会想：这是在挥洒我的霉运，挥洒之后，剩下的就全都是幸运了当我觉得我倒霉了，我就会想：这是在挥洒我的霉运，挥洒之后，剩下的就全都是幸运了当我觉得我倒霉了，我就会想：这是在挥洒我的霉运，挥洒之后，剩下的就全都是幸运了当我觉得我倒霉了，我就会想：这是在挥洒我的霉运，挥洒之后，剩下的就全都是幸运了当我觉得我倒霉了，我就会想：这是在挥洒我的霉运，挥洒之后，剩下的就全都是幸运了",@"image":@(6)},
                        @{@"text":@"当我觉得我倒霉了，我就会想：这是在挥洒我的霉运，挥洒之后，剩下的就全都是幸运了当我觉得我倒霉了，我就会想：这是在挥洒我的霉运，挥洒之后，剩下的就全都是幸运了当我觉得我倒霉了，我就会想：这是在挥洒我的霉运，挥洒之后，剩下的就全都是幸运了当我觉得我倒霉了，我就会想：这是在挥洒我的霉运，挥洒之后，剩下的就全都是幸运了",@"image":@(7)},
                        @{@"text":@"当我觉得我倒霉了，我就会想：这是在挥洒我的霉运，挥洒之后，剩下的就全都是幸运了当我觉得我倒霉了，我就会想：这是在挥洒我的霉运，挥洒之后，剩下的就全都是幸运了当我觉得我倒霉了，我就会想：这是在挥洒我的霉运，挥洒之后，剩下的就全都是幸运了",@"image":@(8)},
                        @{@"text":@"不要为小事遮住视线，我们还有更大的世界。",@"image":@(9)}
                        ];
}

- (void)creatUI{
    [self.view addSubview:self.tableView];
    self.tableView.sd_layout
    .leftEqualToView(self.view)
    .topEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
}



#pragma mark ---- 代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.tableView cellHeightForIndexPath:indexPath cellContentViewWidth:[UIScreen mainScreen].bounds.size.width tableView:tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * cellID = [NSString stringWithFormat:@"cell%ld", indexPath.row];
    
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary * dic = self.dataSource[indexPath.row];
    cell.dic = dic;
    //图片点击方法
    cell.blcok = ^(NSInteger index) {
        NSLog(@"%ld", index);
    };
    
    return cell;
}

@end
