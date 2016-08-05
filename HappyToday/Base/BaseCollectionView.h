//
//  BaseCollectionView.h
//  MyMovie
//
//  Created by Weiwei on 16/3/2.
//  Copyright © 2016年 bever贝沃汇力 weiwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
//用于记录item的宽，同时外界可以对collectionView进行设置item
@property(assign,nonatomic)float itemWidth;


//从PosterView中获得数据
@property(nonatomic,copy)NSArray* dataList;//存着homeModel数据
#pragma -mark 专门创建一个记录当前是哪一个cell在最中间
@property(nonatomic,assign)NSInteger currentIndex;

@end
