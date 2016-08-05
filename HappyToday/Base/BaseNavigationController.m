//
//  BaseNavigationController.m
//  SinaWeibo
//
//  Created by 赵彦飞 on 16/4/5.
//  Copyright © 2016年 WXG. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
 
//    [UINavigationBar appearance]
    
    
    // 获取当前系统的版本号
    NSString *device = [[UIDevice currentDevice] systemVersion];
    NSString *barImage = @"pic_title_bg.9.png";
    if ([device floatValue] >= 7.0) {
        
        barImage = @"navi_bg@2x";
    }
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:barImage] forBarMetrics:UIBarMetricsDefault];
    
    
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    self.navigationBar.backgroundColor = [UIColor blackColor];
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
