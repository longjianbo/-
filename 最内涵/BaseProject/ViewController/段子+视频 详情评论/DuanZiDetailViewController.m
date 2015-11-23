//
//  DuanZiDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuanZiDetailViewController.h"
#import "DuanZiDetailCell.h"
#import "DuanZiDetailViewModel.h"
#import "DuanZiCell.h"
#import "Factory.h"
#import "DuanZiViewController.h"

@interface DuanZiDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)DuanZiDetailViewModel *detailVM;

@end

@implementation DuanZiDetailViewController


-(instancetype)initWithGroup:(long)groupId{
    if (self = [super init]) {
        _groupId = groupId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"详情";
    self.view.backgroundColor = kRGBColor(216, 213, 216);
    [self.tableView.header beginRefreshing];
    [Factory addBackItemToVC:self];
    
}

-(DuanZiDetailViewModel *)detailVM{
    if (!_detailVM) {
        _detailVM = [[DuanZiDetailViewModel alloc]initWithGroupID:self.groupId];
        
    }
    return _detailVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[DuanZiDetailCell class] forCellReuseIdentifier:@"detailCell"];
        
        [_tableView registerClass:[DuanZiCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.backgroundColor = kRGBColor(216, 214, 216);
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.detailVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
        
        
    }
    return _tableView;
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
kRemoveCellSeparator

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
        return 3;
   
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else if (section == 1 ){
        return self.detailVM.topCouts;
    }else{
        return self.detailVM.recentArrCount;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        DuanZiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        [cell.image.imageView setImage:[UIImage imageNamed:@"hoticon_textpage"]];
        
        [cell.userIcon.imageView setImageWithURL:self.userIcon];
        cell.userID.text = self.userID;
        cell.content.text = self.content;
        [cell.categoryName setTitle:self.categoryName forState:0];
        cell.diggCount.text = self.diggCount;
        
        cell.buryCount.text = self.buryCount;
        cell.commentCount.text = self.commentCount;
        cell.shareCount.text = self.shareCount;
        
        return cell;
    }else if (indexPath.section == 2 ){
        DuanZiDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell"];
        [cell.topUserImage.imageView setImageWithURL:[self.detailVM topIconInRecentForRow:indexPath.row]];
        cell.topUserID.text = [self.detailVM topNameInRecentForRow:indexPath.row];
        cell.topTime.text = [self.detailVM topTimeInRecentForRow:indexPath.section];
        cell.topDiggCount.text = [self.detailVM topdiggCountInRecentForRow:indexPath.row];
        cell.topText.text = [self.detailVM topTextInRecentForRow:indexPath.row];
        return cell;
    }else{
        DuanZiDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell"];
        [cell.topUserImage.imageView setImageWithURL:[self.detailVM iconForRow:indexPath.row]];
        cell.topUserID.text = [self.detailVM nameForRow:indexPath.row];
        cell.topTime.text = [self.detailVM timeForRow:indexPath.row];
        cell.topDiggCount.text = [self.detailVM diggCountForRow:indexPath.row];
        cell.topText.text = [self.detailVM textForRow:indexPath.row];

        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return @"新鲜评论";
    }
    if (section == 1 && self.detailVM.topCouts) {
         return @"热点评论";
    }
    return @"";
       
  
}





- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"title1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"what's this 1");
        [self showAlertWithMessage:@"点了title1"];
    }];
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"title2" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"what's this 2");
        [self showAlertWithMessage:@"点了title2"];
    }];
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"title3" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"what's this 3");
        [self showAlertWithMessage:@"点了title3"];
    }];
    UIPreviewAction *action4 = [UIPreviewAction actionWithTitle:@"title4" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"what's this 4");
        [self showAlertWithMessage:@"点了title4"];
    }];
    
    [arr addObject:action1];
    [arr addObject:action2];
    [arr addObject:action3];
    [arr addObject:action4];
    
    return arr;
}

- (void)showAlertWithMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self.duanziDetailVC presentViewController:alert animated:YES completion:nil];
}

@end
