//
//  UITableView+KVO.h
//  TravelNote
//
//  Created by liu AISIDE on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (KVO)

-(void)reloadWithChange:(NSDictionary*)change;

@end
