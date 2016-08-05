//
//  CustomTabBarController.h
//  01封装CustomTabBarController
//
//  Created by Weiwei on 16/2/24.
//  Copyright © 2016年 bever贝沃汇力 weiwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabBarController : UITabBarController

@end


//-----------  CNTabBarItem------------
@interface CNTabBarItem : UIControl{
    
    UIImageView* _imageView;
}
//方法的公开
-(id)initWithFrame:(CGRect)frame tabBarItem:(UITabBarItem*)item;
@end