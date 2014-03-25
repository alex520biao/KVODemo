//
//  ViewController.m
//  KVODemo
//
//  Created by alex on 13-8-15.
//  Copyright (c) 2013年 alex. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+KVO.h"
#import "Person.h"
#import "DictDataModel.h"
@interface ViewController ()
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)ListDataModel *listDataModel;
@property(nonatomic,strong)SetDataModel *setDataModel;
@property(nonatomic,strong)DictDataModel *dictDataModel;

@end

@implementation ViewController
@synthesize tableView=_tableView;
@synthesize listDataModel=_listDataModel;
@synthesize setDataModel=_setDataModel;
@synthesize dictDataModel=_dictDataModel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];

    UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
    self.tableView=tableView;
    
    ListDataModel *listDataModel=[[ListDataModel alloc] initWithObserver:self];
    self.listDataModel=listDataModel;
    
    SetDataModel  *setDataModel=[[SetDataModel alloc] initWithObserver:self];
    self.setDataModel=setDataModel;
    
    DictDataModel *dictDataModel=[[DictDataModel alloc] initWithObserver:self];
    self.dictDataModel=dictDataModel;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.listDataModel loadListData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    NSLog(@"keyPath:%@",keyPath);
//    NSLog(@"change:%@",[change description]);
//    if ([self.model listKeyPath:keyPath ofObject:object]) {
//        [self performSelectorOnMainThread:@selector(update_list_view:) withObject:change waitUntilDone:NO];
//    }else{
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }
//}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(ListDataModel*)dataModel change:(NSDictionary *)change{
    if (dataModel==self.listDataModel) {
        [self performSelectorOnMainThread:@selector(update_list_view:) withObject:change waitUntilDone:NO];
    }
}

-(void)update_list_view:(NSDictionary*)change{
    //UITableView有两种刷新方式
//    [self.tableView reloadWithChange:change];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listDataModel.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Person *person=[self.listDataModel.list objectAtIndex:indexPath.row];
    cell.textLabel.text=person.name;
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Person *person=[[Person alloc] init];
    person.personId=[NSString stringWithFormat:@"%d",self.listDataModel.list.count];
    person.name=[NSString stringWithFormat:@"newName"];
    
//    [self.dictDataModel setValue:@"22" forKey:@"11"];

    //对数组的操作
//    //插入
//    [self.listDataModel listInsertObject:person index:0];

    //追加
    [self.listDataModel listAddObject:person];
    
//    //删除
//    [self.listDataModel listRemoveObjectAtIndex:indexPath.row];

//    //替换
//    [self.listDataModel listReplaceObject:person index:2];

//    //改变元素内容
//    [self.listDataModel listChangeNameAtIndex:indexPath.row newName:@"啊哈哈哈"];
    
//    //本地/网络加载整列数据
//    [self.listDataModel loadListData];
}


@end
