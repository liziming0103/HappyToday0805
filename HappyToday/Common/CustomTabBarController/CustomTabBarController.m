//
//  CustomTabBarController.m
//  01封装CustomTabBarController
//
//  Created by Weiwei on 16/2/24.
//  Copyright © 2016年 bever贝沃汇力 weiwei. All rights reserved.
//

#import "CustomTabBarController.h"

//延展
@interface CustomTabBarController (){
    UIView* _contentView;
    UIImageView* _selectImage;//滑块
    
}

@end


@implementation CustomTabBarController

-(void)viewDidLoad{
    [super viewDidLoad];
#pragma -mark步骤一 创建一个contentView放到tabbar上
    //1.自定义tabbar--contentView
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,KScreenW, 49)];
    //2.设置一个背景颜色,因为图片较小，所以平铺
    [_contentView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"actor_detail_top_background"]]];
    //3.加到tabBar上
    [self.tabBar addSubview:_contentView];
    
    
    
}

#pragma -mark 步骤二 当setViewControllers时获得数据，设置自定义的button
-(void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    
    //1.保留父类的方法
    //（1）创建出item、viewC
    [super setViewControllers:viewControllers];
    
    //2.创建自己的button
    [self creatButton];
    
    
    
}
-(void)creatButton{
#pragma -mark  最后一步优化 创建滑块
    _selectImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 0, KScreenW/self.viewControllers.count -10, 49)];
    _selectImage.image = [UIImage imageNamed:@"home_bottom_tab_arrow"];
    [_contentView addSubview:_selectImage];
    
    
    
    
    //1.步骤一：根据系统viewControllerS数组传过来的控制器的个数，创建自己的button。同时计算每一个button的位置
    for (int i = 0; i < self.viewControllers.count; i++) {
        
        //(1)计算每一个的frame
        CGRect frame = CGRectMake(i*(KScreenW/self.viewControllers.count), 0, KScreenW/self.viewControllers.count, 49);
        
        //(2)根据frame设置一个control
        //自己封装一个类，然后传入frame和 tabBarItem就能够创建一个带有图片的control
        CNTabBarItem* item = [[CNTabBarItem alloc]initWithFrame:frame tabBarItem:[self.viewControllers objectAtIndex:i].tabBarItem];
        
        //（3）item添加到contentView上
        [_contentView addSubview:item];
        
        //(4)设置tag
        item.tag= 1000+i;
        
        //(5)设置点击方法
        [item addTarget:self action:@selector(controlAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
#pragma -mark 设置成control ＝ 1002的中心点
//    CNTabBarItem* centerItem  = (CNTabBarItem*)[_contentView viewWithTag:1002];
//    _selectImage.center = centerItem.center;
    
}

-(void)controlAction:(CNTabBarItem*)item{
    
    //跳转到响应的controllerView上
    //(1)获得当前按钮所对应的控制器的index
    NSInteger index = item.tag - 1000;
    
    [self setSelectedIndex:index];
    
    //让滑块移动，随着item的变化
    [UIView animateWithDuration:.35 animations:^{
        _selectImage.center = item.center;
    }];
    
    
    
}

#pragma -mark步骤三 显示时移除系统的tabbarItem
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self removeTabBarItems];
    
}
-(void)removeTabBarItems{
    
    
    //for in循环遍历self.tabBar上的子时图
    for (UIView* view in self.tabBar.subviews) {
        
       //想要移除item，只能通过一下的方法，通过寻找子视图里，uitabbarButton类的对象，并且移除才可以做到移除item
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            [view removeFromSuperview];
        }
        
    }
    
    
}

@end




//-------------CNTabBarItem----------------
@implementation CNTabBarItem

-(id)initWithFrame:(CGRect)frame tabBarItem:(UITabBarItem*)item{
    
    //复写父类的方法
    if (self = [super initWithFrame:frame]) {
        
        //(1)创建一个imageView
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        //(2)imageView获得image数据
        _imageView.image = item.image;
        
        
        //(3)布局方式(保存图片原来的比例，并且始终在中心显示)
        _imageView.contentMode= UIViewContentModeCenter;
        _imageView.transform = CGAffineTransformMakeScale(.8, .8);
        
        
        
        //(4)加到self
        [self addSubview:_imageView];
        
        
        
    }
    
    
    
    return self;
    
}

@end

