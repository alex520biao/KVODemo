//
//  DictDataModel.m
//  KVODemo
//
//  Created by alex on 13-8-18.
//  Copyright (c) 2013年 alex. All rights reserved.
//

#import "DictDataModel.h"

@interface DictDataModel ()
@property(nonatomic,retain,readwrite)NSMutableDictionary *dict;

@end

@implementation DictDataModel
@synthesize dict=_dict;

-(id)initWithObserver:(id <DataModelValueNotification>)observer{
    self=[super initWithObserver:observer];
    if (self) {
        self.dict=[NSMutableDictionary dictionary];
        [self.dict setValue:@"1111" forKey:@"11"];
        [self.dict setValue:@"1111" forKey:@"22"];
        [self.dict setValue:@"1111" forKey:@"22"];
        [self.dict setValue:@"1111" forKey:@"22"];
        [self addObserver:self forKeyPath:@"dict" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        [self addObserver:self forKeyPath:@"dict.11" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"dict"];
    [self removeObserver:self forKeyPath:@"dict.11"];
    //    [super dealloc];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"keyPath:%@",keyPath);
    NSLog(@"change:%@",[change description]);
    if (object==self&&[keyPath isEqualToString:@"dict"]) {
        [self.observer observeValueForKeyPath:keyPath ofObject:self change:change];
    }
    
//    else{
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }
}

-(void)setValue:(id)value forKey:(NSString *)key{
    [self.dict setValue:value forKey:key];
}

@end
