//
//  SetDataModel.h
//  KVODemo
//
//  Created by alex on 13-8-16.
//  Copyright (c) 2013年 alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataModel.h"
@interface SetDataModel : DataModel
@property (nonatomic, strong,readonly) NSMutableSet *set;

#pragma mark 修改DataModel使用KVO更新UI
- (void)setAddObject;
- (void)setRemoveobject;

@end
