
//
//  smallTableViewCell.m
//  按钮状态
//
//  Created by 主用户 on 16/3/21.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import "smallTableViewCell.h"

@implementation smallTableViewCell
@synthesize btn;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitleColor:[UIColor blackColor] forState:0];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn setTitle:@"未选中状态" forState:0];
        [btn setTitle:@"选中状态" forState:UIControlStateSelected];
        btn.frame = CGRectMake(0, 0, 100, 50);
        [self addSubview:btn];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
