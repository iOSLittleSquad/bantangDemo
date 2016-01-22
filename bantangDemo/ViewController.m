//
//  ViewController.m
//  bantangDemo
//
//  Created by 黄少华 on 16/1/21.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "ViewController.h"
#import "OtherViewController.h"
#import "PushAnimaton.h"
#import "UIImage+Color.h"
#import "Header.h"
#import "PopAnimation.h"
#import "SwipeDismiss.h"
@interface ViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
UINavigationControllerDelegate,
UIViewControllerTransitioningDelegate
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SwipeDismiss *swipeDismiss;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configNav];
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)configNav
{
    self.navigationController.delegate = self;

    UILabel *label = [[UILabel alloc] init];
    label.text = @"半糖";
    label.textColor = [UIColor whiteColor];
    label.bounds = CGRectMake(0, 0, 200, 50);
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    self.navigationController.delegate = self;
}


#pragma mark - UITableViewDelegate && dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"a";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OtherViewController *otherVc = [[OtherViewController alloc] init];
    otherVc.transitioningDelegate = self;
    [self.swipeDismiss wireToViewController:otherVc];
    
    [self.navigationController pushViewController:otherVc animated:YES];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",scrollView.contentOffset.y);
    UIColor *color = [UIColor colorWithRed:229/255.0 green:57/255.0 blue:65/255.0 alpha:1];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithBgColor:[color colorWithAlphaComponent:scrollView.contentOffset.y / 100]] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return [[PushAnimaton alloc] init];
    }else if (operation == UINavigationControllerOperationPop){
        return [[PopAnimation alloc] init];
    }else{
        return nil;
    }
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.swipeDismiss.interacting ? self.swipeDismiss : nil;
}

- (UITableView *)tableView
{
    if (!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:
                      CGRectMake(0, -64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 64) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        UIView *head = [[Header alloc] init];
        head.frame = CGRectMake(0, 0, 0, 100);
        _tableView.tableHeaderView = head;
    }
    return _tableView;
}

- (SwipeDismiss *)swipeDismiss
{
    if (!_swipeDismiss) {
        _swipeDismiss = [[SwipeDismiss alloc] init];
    }
    return _swipeDismiss;
}
@end
