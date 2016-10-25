//
//  NSObject+UncoverLoop.h
//  UncoverLoop
//
//  Created by WzxJiang on 16/10/25.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (UncoverLoop)

/// 所有的成员变量
- (NSDictionary *)ul_allValues;

/// 存在循环引用的成员变量
- (NSDictionary *)ul_loopValues;

@end
