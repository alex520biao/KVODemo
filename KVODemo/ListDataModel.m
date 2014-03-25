//
//  DataModel.m
//  KVODemo
//
//  Created by alex on 13-8-15.
//  Copyright (c) 2013年 alex. All rights reserved.
//

#import "ListDataModel.h"
#import "Person.h"


@interface ListDataModel ()
@property(nonatomic,retain,readwrite)NSMutableArray *list;

@end

extern NSMutableArray *staticArray = nil;
@implementation ListDataModel
@synthesize list=_list;

//initWithObserver方法
-(id)initWithObserver:(id <DataModelValueNotification>)observer{
    self=[super initWithObserver:observer];
    if (self) {
        self.list=[NSMutableArray array];
        [self addObserver:self forKeyPath:@"list" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"list"];
//    [super dealloc];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"self.list index:%d",[self.list indexOfObject:object]);
    NSLog(@"keyPath:%@",keyPath);
    NSLog(@"change:%@",[change description]);
    if (object==self&&[keyPath isEqualToString:@"list"]) {
        [self.observer observeValueForKeyPath:keyPath ofObject:self change:change];
    }
}

#pragma mark action
- (void)loadListData{
    NSMutableArray *newList=[NSMutableArray array];
    for (int i=0; i<10; i++) {
        Person *person=[[Person alloc] init];
        person.personId=[NSString stringWithFormat:@"%d",i];
        person.name=[NSString stringWithFormat:@"name%d",i];
        [newList addObject:person];
    }
    self.list=newList;//调用setter方法
    
//    //针对self.list.object[index].name进行检测
//    [self.list addObserver:self toObjectsAtIndexes:[[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0,self.list.count)] forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

-(void)listAddObject:(Person*)person{
    [[self mutableArrayValueForKey:@"list"] insertObject:person atIndex:self.list.count];
}

- (void)listInsertObject:(Person*)person index:(NSUInteger)index{
    [[self mutableArrayValueForKey:@"list"] insertObject:person atIndex:index];
}

- (void)listReplaceObject:(Person*)person index:(NSUInteger)index{
    [[self mutableArrayValueForKey:@"list"] replaceObjectAtIndex:index withObject:person];
}

- (void)listRemoveObjectAtIndex:(NSUInteger)index{
    [[self mutableArrayValueForKey:@"list"] removeObjectAtIndex:index];
}

-(void)listChangeNameAtIndex:(NSUInteger)index newName:(NSString*)newName{
    Person *person=(Person*)[self.list objectAtIndex:index];
    person.name=newName;
    [[self mutableArrayValueForKey:@"list"] replaceObjectAtIndex:index withObject:person];
}

////直接对数组元素的key进行检测
//-(void)listChangeNameAtIndex:(NSUInteger)index newName:(NSString*)newName{
//    Person *person=(Person*)[self.list objectAtIndex:index];
//    person.name=newName;
//}





@end
