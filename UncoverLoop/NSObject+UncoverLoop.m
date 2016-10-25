//
//  NSObject+UncoverLoop.m
//  UncoverLoop
//
//  Created by WzxJiang on 16/10/25.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "NSObject+UncoverLoop.h"
#import <objc/runtime.h>

@implementation NSObject (UncoverLoop)

- (NSArray *)ul_allPropertys {
    NSMutableArray * propertyArr = [NSMutableArray array];
    
    unsigned int outCount;
    
    objc_property_t * properties = class_copyPropertyList([self class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding] ;
        
        [propertyArr addObject:propertyName];
    }
    
    free(properties);
    
    return propertyArr;
}

- (NSDictionary *)ul_allValues {
    NSArray * allPropertys = [self ul_allPropertys];
    NSMutableDictionary * allValues = [NSMutableDictionary dictionary];
    [allPropertys enumerateObjectsUsingBlock:^(NSString * property, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![@[@"debugDescription", @"description", @"hash", @"superclass"] containsObject: property]) {
            [allValues setObject:[self valueForKey:property] forKey:property];
        }
    }];
    return [allValues copy];
}

- (NSDictionary *)ul_loopValues {
    NSDictionary * allValues = [self ul_allValues];
    NSMutableDictionary * loopValues = [NSMutableDictionary dictionary];
    for (NSString * key in allValues.allKeys) {
        id value = allValues[key];
        if (value) {
            [loopValues setObject:value forKey:key];
        }
    }
    return [loopValues copy];
}

@end
