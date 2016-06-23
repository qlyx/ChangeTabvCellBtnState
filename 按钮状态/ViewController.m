//
//  ViewController.m
//  按钮状态
//
//  Created by 主用户 on 16/3/18.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView *tab;
}
@end

@implementation ViewController
@synthesize btnStateArr;
- (void)viewDidLoad {
    [super viewDidLoad];
    btnStateArr = [[NSMutableArray alloc] init];
   
    tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    tab.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tab.delegate = self;
    tab.dataSource = self;
    [self.view addSubview:tab];
    //初始化数据源
    for (int j = 0; j<5; j++) {
        //假设目前大tab有5个cell，每个cell嵌套一个小tab,每个小tab有3个cell
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for (int i = 0; i<3; i++) {
            [arr addObject:@"0"];
        }
        [btnStateArr addObject:arr];
    }
    
}
#pragma -mark- tableView的代理方法

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return btnStateArr.count;
    
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
        //网关列表
    static NSString *indentifier = @"Cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        cell.vc = self;
        
    }
    //防止数据源越界
    if (btnStateArr.count>indexPath.row) {
        //清空原来的数据
        [cell.seletarr removeAllObjects];
        //重新获取按钮状态
        [cell.seletarr addObjectsFromArray:[btnStateArr objectAtIndex:indexPath.row]];
        //是第几个cell，当小tab里面的btn状态改变时可随时更改大tab的数据源btnStateArr
        cell.index = (int)indexPath.row;
    }
    
    return cell;
                                                                        
                                                                        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
