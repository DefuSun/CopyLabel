//
//  ViewController1.m
//  CopyLabel
//
//  Created by mac on 16/6/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    DFCopyLabel *label = [[DFCopyLabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    //    label.backgroundColor = [UIColor greenColor];
    //    [self.view addSubview:label];
    //    label.text = @"22211";
    
    
    _dataArray = @[@"111111",@"222222",@"333333",@"444444",@"111111",@"222222",@"333333",@"444444",@"111111",@"222222",@"333333",@"444444"];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 0) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor purpleColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    //    DFCopyLabel *label1 = [[DFCopyLabel alloc] initWithFrame:CGRectMake(100, self.view.frame.size.height - 40, 100, 30)];
    //    label1.backgroundColor = [UIColor yellowColor];
    //    [self.view addSubview:label1];
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor greenColor];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, tableView.frame.size.width/2 - 10, 44)];
    label1.text = @"充值码";
    label1.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(tableView.frame.size.width/2 + 5, 0, tableView.frame.size.width/2 - 10, 44)];
    label2.text = @"到期时间";
    label2.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:label2];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(tableView.frame.size.width/2, 7, 1, 30)];
    lineView.backgroundColor = [UIColor grayColor];
    [headerView addSubview:lineView];
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor greenColor];
    
    UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, tableView.frame.size.width, 44)];
    inputView.backgroundColor = [UIColor whiteColor];
    [footerView addSubview:inputView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 60, inputView.frame.size.height)];
    label.text = @"充值码";
    label.textAlignment = NSTextAlignmentCenter;
    [inputView addSubview:label];
    
    CGFloat inputFeild_x = label.frame.origin.x+label.frame.size.width;
    UITextField *_inputFeild = [[UITextField alloc] initWithFrame:CGRectMake(inputFeild_x, 0, inputView.frame.size.width - inputFeild_x, inputView.frame.size.height)];
    _inputFeild.keyboardType = UIKeyboardTypeDefault;
    _inputFeild.returnKeyType = UIReturnKeyDone;
    _inputFeild.placeholder = @"请输入充值码";
    [inputView addSubview:_inputFeild];
    
    return footerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 200;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    
    //    DFCopyLabel *label = [[DFCopyLabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    //    label.backgroundColor = [UIColor greenColor];
    //    [cell.contentView addSubview:label];
    //    label.text = _dataArray[indexPath.row];
    
    //    [cell configDate:_dataArray[indexPath.row]];
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    if(action == @selector(copy:))
    {
        return YES;
    }else{
        return [super canPerformAction:action withSender:sender];
    }
}
- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    if(action == @selector(copy:))
    {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        [pasteboard setString:_dataArray[indexPath.row]];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
