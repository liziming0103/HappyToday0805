//
//  MeViewController.m
//  HappyToday
//
//  Created by Ale (ziming) Lee on 16/7/28.
//  Copyright © 2016年 ziming_lee. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {

        self.tabBarItem.image = [UIImage imageNamed:@"icon_tab4_normal@3x"];
        self.navigationItem.title = @"我的";

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
