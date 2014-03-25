//
//  DataModel.h
//  KVODemo
//
//  Created by alex on 13-8-16.
//  Copyright (c) 2013年 alex. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_OPTIONS(NSUInteger, KeyValueChangeType) {
    KeyValueChangeType_NSMutableArray = 1,//数组
    KeyValueChangeType_NSMutableSet = 2   //集合
};


@class DataModel;
@protocol DataModelValueNotification <NSObject>
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(DataModel*)dataModel change:(NSDictionary *)change;


@end

@interface DataModel : NSObject
@property (nonatomic, assign,readonly)id <DataModelValueNotification> observer;

-(id)initWithObserver:(id <DataModelValueNotification>)observer;

@end
