//
//  TableViewCell.m
//  按钮状态
//
//  Created by 主用户 on 16/3/18.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import "TableViewCell.h"
#import "smallTableViewCell.h"
@implementation TableViewCell
{
    UITableView  *tab;
}
@synthesize vc,seletarr;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        //网关管理
        tab = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, [[UIScreen mainScreen] bounds].size.width-10,150) style:UITableViewStylePlain];
        tab.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tab.delegate = self;
        tab.dataSource = self;
        [self addSubview:tab];
        
        seletarr = [[NSMutableArray alloc] init];
    }
    return self;
}
#pragma -mark- tableView的代理方法

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return seletarr.count;
    
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //网关列表
    static NSString *indentifier = @"Cell";
    smallTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[smallTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    cell.btn.tag = indexPath.row;
    [cell.btn addTarget:self action:@selector(selete:) forControlEvents:UIControlEventTouchUpInside];
    if (seletarr.count>indexPath.row) {
        if ([[seletarr objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
            cell.btn.selected = NO;
            
        }else
            cell.btn.selected = YES;
    }
    
    return cell;
    
    
}
-(void)selete:(UIButton *)btn
{
     if (seletarr.count>0) {
    if ([[seletarr objectAtIndex:btn.tag] isEqualToString:@"0"]) {
        [seletarr replaceObjectAtIndex:btn.tag withObject:@"1"];
        
    }else
    {
        [seletarr replaceObjectAtIndex:btn.tag withObject:@"0"];
    }
    [tab reloadData];
    [vc.btnStateArr replaceObjectAtIndex:self.index withObject:seletarr];
     }
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
