//
//  UITableView+KVO.m
//  TravelNote
//
//  Created by liu AISIDE on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UITableView+KVO.h"

@implementation UITableView (KVO)

-(void)reloadWithChange:(NSDictionary*)change{
    NSNumber *kind = [change objectForKey:NSKeyValueChangeKindKey];
    
    if ([kind integerValue]==NSKeyValueChangeSetting) {//NSArray变化类型:重新赋值:刷新UITableView
        [self reloadData];
    }
    else{//NSArray变化类型:添加/删除/替换
        //获取变化值
        NSIndexSet *indices = [change objectForKey:NSKeyValueChangeIndexesKey];
        
        NSLog(@"indexSet ==== %@",indices);
        if (indices == nil||indices.count==0)
            return; // Nothing to do
        
        // Build index paths from index sets
        NSUInteger indexCount =indices.count;
        NSUInteger buffer[indexCount];
        [indices getIndexes:buffer maxCount:indexCount inIndexRange:nil];
        
        NSMutableArray *indexPathArray = [NSMutableArray array];
        for (int i = 0; i < indexCount; i++) {
            NSUInteger indexPathIndices[2];
            indexPathIndices[0] = 0;
            indexPathIndices[1] = buffer[i];
            NSIndexPath *newPath = [NSIndexPath indexPathWithIndexes:indexPathIndices length:2];
            
            NSLog(@"newPath ==== %d,=====%d",newPath.row,newPath.section);
            [indexPathArray addObject:newPath];
        }
        
        [self beginUpdates];
        //判断值变化是insert、delete、replace
        if ([kind integerValue] == NSKeyValueChangeInsertion)  // Operations were added
        {
            //[self insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationFade];
            [self insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationNone];
        }
        else if ([kind integerValue] == NSKeyValueChangeRemoval)  // Operations were removed
            [self deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationFade];
        else if ([kind integerValue] == NSKeyValueChangeReplacement)  // Operations were replace
            [self reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationFade ];
        [self endUpdates];
    }
}

@end
