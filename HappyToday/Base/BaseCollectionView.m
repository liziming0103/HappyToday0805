//
//  BaseCollectionView.m
//  MyMovie
//
//  Created by Weiwei on 16/3/2.
//  Copyright © 2016年 bever贝沃汇力 weiwei. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView
#pragma -mark子类化CollectionView
-(id)initWithFrame:(CGRect)frame{
    
#pragma -mark itemWidth的大小由子类决定
#pragma -mark 单元格的注册让子类自己来决定
#pragma -mark 产生单元格的方法子类要复写
    
    
    //1.创建一个layout
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc]init];
    //2.设置布局类的属性(水平滑动)
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        
        self.currentIndex = 0;
        

        
        
    }
    
    return self;
    
    
}

#pragma -mark 因为一开始自定义初始化没能得到itemWidth的宽度，无法设置item大小，所以我们增加了一个方法来设置item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(self.itemWidth, self.frame.size.height -20);
    
}

#pragma -mark 这个方法不需要改变
//必须实现的方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    //使用datalist
    return _dataList.count;
    
    
}

#pragma -mark 留给子类决定
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
    
}

#pragma -mark 这个方法保留，但是偏移值要改变
//设置内容的偏移,需要导入布局累的代理头文件，不需要设置布局类的代理
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //上、左、下、右进行内容的偏移
    return UIEdgeInsetsMake(0,(self.bounds.size.width -self.itemWidth)/2, 0,(self.bounds.size.width -self.itemWidth)/2 );
}

#pragma -mark 保留完全保留
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    //3.首先获得当前的系统偏移值
    CGFloat offset = targetContentOffset ->x;
    
    
    //2.现在可以看出最后位置的偏移量和index的值有关
    int index = (offset+ self.itemWidth/2+5)/(self.itemWidth+10);
    
    //1.思考当最后偏移到每个lable的中心位置时，我们的偏移量是多少
    // index 0  ->     0
    // index 1  ->     iteW+10
    // index 2  ->     2*(iteW+10)
    // index 3  ->     3*(iteW+10)
    CGFloat newOffset =index* (self.itemWidth +10);
    targetContentOffset ->x = newOffset;
    
    
    //重新记录当前的中心页的index
    self.currentIndex = index;
    
}

#pragma -mark 保留最基础的点击滑动，其他的方法子类自己重写
//cell被点，然后滑动到collectionView的中心点
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
        //当点击的cell不是中间cell，不反转而是平移
        //让某一个cell滑动到相应的位置
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        //平移结束，要把该cell的indexPath记录成中心页
        self.currentIndex = indexPath.row;
        
    
    
}




@end
