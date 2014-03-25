//
//  DataModel.h
//  KVODemo
//
//  Created by alex on 13-8-15.
//  Copyright (c) 2013年 alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataModel.h"
#import "Person.h"
@interface ListDataModel : DataModel
@property(nonatomic,retain,readonly)NSMutableArray *list;

#pragma mark 修改DataModel使用KVO更新UI
- (void)loadListData;//本地读取数据或者网络加载数据(网络加载还需返回加载进度)
-(void)listAddObject:(Person*)person;
- (void)listInsertObject:(Person*)person index:(NSUInteger)index;
- (void)listReplaceObject:(Person*)person index:(NSUInteger)index;
- (void)listRemoveObjectAtIndex:(NSUInteger)index;
- (void)listChangeNameAtIndex:(NSUInteger)index newName:(NSString*)newName;

@end
