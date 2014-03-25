//
//  SetDataModel.m
//  KVODemo
//
//  Created by alex on 13-8-16.
//  Copyright (c) 2013年 alex. All rights reserved.
//

#import "SetDataModel.h"
#import "Person.h"

@interface SetDataModel ()
@property(nonatomic,strong,readwrite)NSMutableSet *set;
@end

@implementation SetDataModel
@synthesize set=_set;

//initWithObserver方法
-(id)initWithObserver:(id <DataModelValueNotification>)observer{
    self=[super initWithObserver:observer];
    if (self) {        
        self.set=[NSMutableSet set];
        for (int i=0; i<10; i++) {
            Person *person=[[Person alloc] init];
            person.personId=[NSString stringWithFormat:@"%d",i];
            person.name=[NSString stringWithFormat:@"name%d",i];
            [self.set addObject:person];
        }
        [self addObserver:self forKeyPath:@"set" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"set"];
    //    [super dealloc];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"keyPath:%@",keyPath);
    NSLog(@"change:%@",[change description]);
    if (object==self&&[keyPath isEqualToString:@"set"]){
        [self.observer observeValueForKeyPath:keyPath ofObject:self change:change];
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark action
- (void)setAddObject{
    Person *person=[[Person alloc] init];
    person.personId=[NSString stringWithFormat:@"%d",self.set.count];
    [[self mutableSetValueForKey:@"set"] addObject:person];
}

-(void)setRemoveobject{
    Person *person=[[self.set objectEnumerator] nextObject];
    [[self mutableSetValueForKey:@"set"] removeObject:person];
}


@end
