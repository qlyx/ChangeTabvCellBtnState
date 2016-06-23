//
//  TableViewCell.h
//  按钮状态
//
//  Created by 主用户 on 16/3/18.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface TableViewCell : UITableViewCell<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)ViewController *vc;
@property(nonatomic,retain)NSMutableArray *seletarr;//嵌套tab的btn的选中状态
@property(nonatomic)int index;//记录当前cell是大tab里面第几个cell
@end
