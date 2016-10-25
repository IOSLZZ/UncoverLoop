//
//  UncoverLoop.h
//  UncoverLoop
//
//  Created by WzxJiang on 16/10/25.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UncoverLoop <NSObject>

@optional
/// 需要查询的私有变量key
+ (NSArray <NSString *> *)ul_loopPrivatelyKeys;

@end
