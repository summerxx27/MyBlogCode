//
//  TestViewController.m
//  XTAttributeLabel
//
//  Created by zjwang on 16/7/26.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "TestViewController.h"
#import "UINavigationBar+Extensions.h"
#define cellIdentifier @"cellId"
#define HEADERVIEW_HEIGHT 200
@interface TestViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation TestViewController

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height + 64) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, HEADERVIEW_HEIGHT)];
    imageView.image = [UIImage imageNamed:@"headerView"];
    
    [self.view addSubview:self.tableView];
    _tableView.tableHeaderView = imageView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = @"I AM A TEST CELL";
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0) {
        if (offsetY >= 44) {
            [self setNavigationBarTransformProgress:1];
        } else {
            [self setNavigationBarTransformProgress:(offsetY / 44)];
        }
    } else {
        [self setNavigationBarTransformProgress:0];
        self.navigationController.navigationBar.backIndicatorImage = [UIImage new];
    }
}
- (void)setNavigationBarTransformProgress:(CGFloat)progress
{
    [self.navigationController.navigationBar xtSetTranslationY:(-44 * progress)];
    [self.navigationController.navigationBar xtSetElementsAlpha:(1 - progress)];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar xtReset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
