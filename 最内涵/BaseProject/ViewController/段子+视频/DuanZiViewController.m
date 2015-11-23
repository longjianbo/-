//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuanZiViewController.h"
#import "DuanZiCell.h"
#import "DuanZiViewModel.h"
#import "ShiPinViewController.h"
#import "JDFPeekabooCoordinator.h"
#import "DuanZiDetailViewController.h"
#import "Factory.h"


@interface DuanZiViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>
{
    CGPoint touchPoint;
    UIImageView *canDraw;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)DuanZiViewModel *duanziVM;
@property(nonatomic,strong)UISegmentedControl *segmentControl;

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UIViewController *childVC;
@end

@implementation DuanZiViewController

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    DuanZiDetailViewController *vc = [sb instantiateViewControllerWithIdentifier:@"DuanZiDetailViewController"];
    vc.preferredContentSize = CGSizeMake(0.0f, [[UIScreen mainScreen] bounds].size.height - 100);
    vc.duanziDetailVC = self;
    
    CGRect rect = CGRectMake(10, location.y - 10, self.view.frame.size.width - 20, 50);//这个50的高度是点击触发3D Touch的高度，如果像短信之类的是表格，一般就是表格的高度
    previewingContext.sourceRect = rect;
    
    return vc;
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}


+ (UINavigationController *)standardDuanZiNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DuanZiViewController *vc = [[DuanZiViewController alloc] init];
        
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
        UINavigationBar *bar = [UINavigationBar appearance];
        bar.backgroundColor = kRGBColor(253, 249, 255);
        navi.view.backgroundColor = kRGBColor(253, 249, 255);
    });
    return navi;
}
-(UISegmentedControl *)segmentControl{
    if (!_segmentControl) {
        _segmentControl = [[UISegmentedControl alloc]initWithItems:@[@"段子",@"视频"]];
        _segmentControl.frame = CGRectMake(0, 0, 200, 30);
        _segmentControl.selectedSegmentIndex = 0;
        _segmentControl.layer.cornerRadius = 100;
        _segmentControl.tintColor = [UIColor cloudsColor];
        [self.navigationController.navigationBar.topItem setTitleView:_segmentControl];
        /** 添加事件 */
        [_segmentControl addTarget:self action:@selector(gotoShiPin) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentControl;
}

-(void)gotoShiPin{
    if (self.segmentControl.selectedSegmentIndex == 1) {
        ShiPinViewController *vc = [ShiPinViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"段子";
    
    self.view.backgroundColor = kRGBColor(216, 213, 216);
    [self.tableView.header beginRefreshing];
    self.segmentControl.hidden = NO;
    [Factory addMenuItemToVC:self];
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(DuanZiViewModel *)duanziVM{
    if (!_duanziVM) {
        _duanziVM = [DuanZiViewModel new];
        
    }
    return _duanziVM;
}

-(UITableView *)tableView{
//    _tableView1 = _tableView;
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[DuanZiCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.backgroundColor = kRGBColor(216, 214, 216);
        
        [self.view addSubview:_tableView];
        
        self.tableView.showsVerticalScrollIndicator = YES;
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.duanziVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
                
            }];
        }];
        
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.duanziVM getMoreDataCompletionHandle:^(NSError *error) {
                
                [self.tableView.footer endRefreshing];
                [self.tableView reloadData];
            }];
        }];
        
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return self.duanziVM.rowNumber;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DuanZiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.image.imageView setImage:[UIImage imageNamed:@"hoticon_textpage"]];
    
    [cell.userIcon.imageView setImageWithURL:[self.duanziVM userIconForRow:indexPath.section]];
    cell.userID.text = [self.duanziVM nameForRow:indexPath.section];
    cell.content.text = [self.duanziVM contentForRow:indexPath.section];
    [cell.categoryName setTitle:[self.duanziVM categoryNameForRow:indexPath.section] forState:0];
    cell.diggCount.text =[self.duanziVM diggCountForRow:indexPath.section];
    
    cell.buryCount.text = [self.duanziVM buryCountForRow:indexPath.section];
    cell.commentCount.text = [self.duanziVM commentCountForRow:indexPath.section];
    cell.shareCount.text = [self.duanziVM shareCountForRow:indexPath.section];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 2;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DuanZiDetailViewController *vc =[DuanZiDetailViewController new];
    vc.groupId = [self.duanziVM groupIdForRow:indexPath.section];
    
    vc.userIcon = [self.duanziVM userIconForRow:indexPath.section];
    vc.userID = [self.duanziVM nameForRow:indexPath.section];
    vc.content = [self.duanziVM contentForRow:indexPath.section];
    vc.categoryName = [self.duanziVM categoryNameForRow:indexPath.section];
    vc.diggCount = [self.duanziVM diggCountForRow:indexPath.section];
    vc.buryCount = [self.duanziVM buryCountForRow:indexPath.section];
    vc.commentCount = [self.duanziVM commentCountForRow:indexPath.section];
    vc.shareCount = [self.duanziVM shareCountForRow:indexPath.section];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
