//
//  HomeViewController.m
//  HappyToday
//
//  Created by Ale (ziming) Lee on 16/7/26.
//  Copyright © 2016年 ziming_lee. All rights reserved.
//

#import "HomeViewController.h"
#import "CityViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {

        self.tabBarItem.image = [UIImage imageNamed:@"icon_tab1_press@2x"];
        
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self _setCityButton];

}

-(void)_setCityButton{

    UIButton *cityBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 25)];
    [cityBtn setTitle:@"青岛" forState:UIControlStateNormal];
    [cityBtn addTarget:self action:@selector(cityBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:cityBtn];

}
-(void)cityBtnAction:(UIButton *)button{

    //1.创建一个CityViewController
    CityViewController *cityVC = [[CityViewController alloc]init];
    [cityVC setHidesBottomBarWhenPushed:YES];
    //2.弹出cityVC
    [self.navigationController presentViewController:cityVC animated:YES completion:nil];
//    [self.navigationController pushViewController:cityVC animated:YES];

}
-(void)_setTitleView{

    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenW, 30+30)];
    UILabel *title = [[UILabel alloc]initWithFrame:titleView.bounds];
    title.text = @"城市选择";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor blackColor];
    [titleView addSubview:title];
    //    titleView.backgroundColor = [UIColor greenColor];

    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 20, 20, titleView.height/3)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"Login_close@3x"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:backBtn];

    [self.view addSubview:titleView];

}
-(void)backBtnAction:(UIButton *)button{

    [self dismissViewControllerAnimated:YES completion:nil];
    
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
