//
//  BaseModel.m
//  MyMovie
//
//  Created by Weiwei on 16/2/27.
//  Copyright © 2016年 bever贝沃汇力 weiwei. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
/*  原理
    1.给一个model传来一个字典
    2.字典会便利自己所有的key，然后拼成set方法
    3.如果model 存在该拼接的方法，就调用该方法，给自己的属性复制
 */
 



-(id)initWithDic:(NSDictionary *)dic{
    
    //一。保留父类init方法
    if (self = [super init]) {
        //二。给字典属性负值，存起来
        _dic = dic;
        
        //三。进行字典key值的便利，拼接set方法
        NSArray* allKeys = [_dic allKeys];
        //1.便利字典的key
        for (NSString* key in allKeys) {
          //将key转换成首字母大写的字符串
//          NSString* string = [key capitalizedString];
            
          NSString* startChar = [[key substringToIndex:1]uppercaseString];
          NSString* otherChar = [key substringFromIndex:1];
            
          //继续拼接字符串（+set）
          NSString* methodString = [NSString stringWithFormat:@"set%@%@:",startChar,otherChar];
//            NSLog(@"%@",methodString);
            
          //实现字符串拼接方法
          SEL method = NSSelectorFromString(methodString);
            
          //让model调用自己的属性的set方法
            //安全性质的判断，如果model存在该set方法
            if ([self respondsToSelector:method] == YES ) {
                //如果有这个属性，有这个方法
                [self performSelector:method withObject:[dic objectForKey:key]];
                
                
            }
            
            
        }
    }

    return self;
    
}


#pragma -mark 重写setMapDic方法
//KEY 是model的属性名  value是josn文件中本来与之对应的key

-(void)setMapDic:(NSDictionary *)mapDic{
    
    //KEY:model属性名 myID  value:_dic 的key id
    _mapDic = mapDic;
    
    //1.取出mapDic的所有的key值
    NSArray* array = [mapDic allKeys];
    
    //2.取出key值拼接方法
    for (NSString* key in array) {
        
        NSString* startChar = [[key substringToIndex:1]uppercaseString];
        NSString* otherChar = [key substringFromIndex:1];
        
        //继续拼接字符串（+set）
        NSString* methodString = [NSString stringWithFormat:@"set%@%@:",startChar,otherChar];
        
        //利用字符串拼接方法
        SEL method = NSSelectorFromString(methodString);
        
        if ([self respondsToSelector:method] == YES) {
            
            //在mapDic中利用当前的key取出当前的value
            NSString* josnKey = [mapDic objectForKey:key];
            //利用josnKey取_dic中的对应的数据
            [self performSelector:method withObject:[_dic objectForKey:josnKey]];
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
}





@end
