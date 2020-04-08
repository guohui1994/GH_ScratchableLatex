//
//  TableViewCell.h
//  jiugongge
//
//  Created by ZhiYuan on 2020/4/7.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^selectIndex)(NSInteger index);
@interface TableViewCell : UITableViewCell

@property (nonatomic, strong)NSDictionary * dic;

@property (nonatomic, copy)selectIndex blcok;

@end

NS_ASSUME_NONNULL_END
