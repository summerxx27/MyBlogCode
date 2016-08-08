//
//  ViewController.m
//  XTAttributeLabel
//
//  Created by zjwang on 16/7/26.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+Extensions.h"
#import "TableViewCell.h"

#define cellIdentifier @"cellId"
#define HEADERVIEW_HEIGHT 260.0
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -64, self.view.frame.size.width, self.view.frame.size.height + 64) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 40);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, HEADERVIEW_HEIGHT)];
    imageView.image = [UIImage imageNamed:@"headerView"];
    
    [self.view addSubview:self.tableView];
    _tableView.rowHeight = 44 * 4;
    _tableView.backgroundColor = [UIColor colorWithRed:0.8187 green:0.9776 blue:1.0 alpha:1.0];
    _tableView.tableHeaderView = imageView;
    [self.navigationController.navigationBar xtSetBackgroundColor:[UIColor clearColor]];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"header";
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor *color = [UIColor colorWithRed:0.302 green:0.6271 blue:1.0 alpha:1.0];
    CGFloat offset_y = scrollView.contentOffset.y;
    NSLog(@"offset_y === %f", offset_y);
    if (offset_y > -44) {
        CGFloat alpha = MIN(1, 1 - (- offset_y / 64));
        [self.navigationController.navigationBar xtSetBackgroundColor:[color colorWithAlphaComponent: alpha]];
        
    }else
    {
        [self.navigationController.navigationBar xtSetBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
    [self scrollViewDidScroll:self.tableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [self.navigationController.navigationBar xtReset];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
