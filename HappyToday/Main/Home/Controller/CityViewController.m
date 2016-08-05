//
//  CityViewController.m
//  HappyToday
//
//  Created by Ale (ziming) Lee on 16/8/5.
//  Copyright © 2016年 ziming_lee. All rights reserved.
//

#import "CityViewController.h"

@interface CityViewController ()

@end

@implementation CityViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self _registerCollectionCell];

}
- (IBAction)BackButtonAction:(UIButton *)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
}
/**********************************************/

-(void)_registerCollectionCell{

    [_cityCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"city_cell"];



}

/***********UICollectionViewDelegate***********/
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{


    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"city_cell" forIndexPath:indexPath];

    return cell;
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
