//
//  OtherViewController.m
//  bantangDemo
//
//  Created by 黄少华 on 16/1/22.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "OtherViewController.h"
#import "PopAnimation.h"
#import "ViewController.h"
@interface OtherViewController ()<UINavigationControllerDelegate>

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Two";
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
