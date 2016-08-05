//
//  CityViewController.h
//  HappyToday
//
//  Created by Ale (ziming) Lee on 16/8/5.
//  Copyright © 2016年 ziming_lee. All rights reserved.
//

#import "BaseViewController.h"

@interface CityViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *cityCollectionView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
