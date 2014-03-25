//
//  ViewController.h
//  KVODemo
//
//  Created by alex on 13-8-15.
//  Copyright (c) 2013年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDataModel.h"
#import "SetDataModel.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,DataModelValueNotification>

@end
