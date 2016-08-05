//
//  BaseModel.h
//  MyMovie
//
//  Created by Weiwei on 16/2/27.
//  Copyright © 2016年 bever贝沃汇力 weiwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

//传入一个字典
#pragma -mark 定制一个model的init方法，传入一个dic
//1.初始化init 2._dic = dic 3.便利dic里的key，拼接set方法
-(id)initWithDic:(NSDictionary*)dic;

@property(retain,nonatomic)NSDictionary* dic;


//问题当 model的属性名和_dic里的key不相同时。那我们只能自己创建一个特例字典 key:model属性名 value:_dic里与之对应的key名
//专门用来搞定：model属性和字典key值不对应的情况
@property(retain,nonatomic)NSDictionary* mapDic;

@end
