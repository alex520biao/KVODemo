//
//  DictDataModel.h
//  KVODemo
//
//  Created by alex on 13-8-18.
//  Copyright (c) 2013年 alex. All rights reserved.
//

#import "DataModel.h"

@interface DictDataModel : DataModel
@property(nonatomic,retain,readonly)NSDictionary *dict;
-(void)setValue:(id)value forKey:(NSString *)key;
@end
