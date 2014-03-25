//
//  DataModel.m
//  KVODemo
//
//  Created by alex on 13-8-16.
//  Copyright (c) 2013年 alex. All rights reserved.
//

#import "DataModel.h"

@interface DataModel ()
@property (nonatomic, assign,readwrite)id <DataModelValueNotification> observer;

@end

@implementation DataModel
-(id)initWithObserver:(id <DataModelValueNotification>)observer{
    self=[self init];
    if (self) {        
        self.observer=observer;
    }
    return self;
}

@end
