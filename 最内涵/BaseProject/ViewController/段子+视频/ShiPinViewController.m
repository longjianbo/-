//
//  ShiPinViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiPinViewController.h"
#import "DuanZiCell.h"
#import "ShiPinModel.h"
#import "ShiPinViewModel.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "JDFPeekabooCoordinator.h"
@interface ShiPinCell : DuanZiCell
@property(nonatomic,strong)UIButton *videoBtn;

@property(nonatomic,strong)UIImageView *image1;
@property(nonatomic,strong)NSURL *videoURL;
@end

@implementation ShiPinCell
- (UIButton *)videoBtn {
    if(_videoBtn == nil) {
        _videoBtn = [UIButton buttonWithType:0];
        [self.contentView addSubview:_videoBtn];
        [_videoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.categoryName.mas_bottom).mas_equalTo(10);
            make.leftMargin.mas_equalTo(self.categoryName.mas_leftMargin);
            make.size.mas_equalTo(CGSizeMake(kWindowW-40, kWindowW/2));
        }];
        [_videoBtn bk_addEventHandler:^(id sender) {
            AVPlayer *player = [AVPlayer playerWithURL:_videoURL];
            [player play];
            [ShiPinCell sharedInstance].player =player;
            [sender addSubview:[ShiPinCell sharedInstance].view];
            [[ShiPinCell sharedInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];

        } forControlEvents:UIControlEventTouchUpInside];
        
        
   
}
     return _videoBtn;
}

+(AVPlayerViewController *)sharedInstance{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}
-(void)prepareForReuse{
    [super prepareForReuse];
    //判断当前cell是否由播放 如果有则删除掉
    [[ShiPinCell sharedInstance].view removeFromSuperview];
    [ShiPinCell sharedInstance].player = nil;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.image1 = [UIImageView new];
        [self.contentView addSubview:self.image1];
        [self.image1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(-5);
            make.left.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(25, 16));
        }];
        
        
        self.diggCount = [[UILabel alloc] init];
        self.diggCount.font = [UIFont systemFontOfSize:12];
        self.diggCount.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.diggCount];
        UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"digupicon_textpage"]];
        imageView1.layer.cornerRadius = 36/2;
        [self.contentView addSubview:imageView1];
        [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(36, 36));
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.videoBtn.mas_bottom).mas_equalTo(30);
            make.bottom.mas_equalTo(-10);
            
        }];
        [self.diggCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView1.mas_right).mas_equalTo(0);
            make.centerY.mas_equalTo(imageView1);
        }];
        
        
        self.buryCount = [[UILabel alloc] init];
        self.buryCount.font = [UIFont systemFontOfSize:12];
        self.buryCount.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.buryCount];
        UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"digdownicon_textpage"]];
        imageView2.layer.cornerRadius = 36/2;
        [self.contentView addSubview:imageView2];
        [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(36, 36));
            make.centerY.mas_equalTo(self.diggCount);
            make.left.mas_equalTo(self.diggCount.mas_right).mas_equalTo(kContentImage);
        }];
        [self.buryCount mas_makeConstraints:^
         (MASConstraintMaker *make) {
             make.left.mas_equalTo(imageView2.mas_right).mas_equalTo(5);
             make.centerY.mas_equalTo(self.diggCount);
         }];
        

        self.commentCount = [[UILabel alloc] init];
        self.commentCount.font = [UIFont systemFontOfSize:12];
        self.commentCount.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.commentCount];
        UIImageView *imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"commenticon_textpage"]];
        imageView3.layer.cornerRadius = 36/2;
        [self.contentView addSubview:imageView3];
        [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(36, 36));
            make.centerY.mas_equalTo(self.diggCount);
            make.left.mas_equalTo(self.buryCount.mas_right).mas_equalTo(kContentImage);
        }];
        [self.commentCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView3.mas_right).mas_equalTo(5);
            make.centerY.mas_equalTo(self.buryCount);
        }];
        
        self.shareCount = [[UILabel alloc] init];
        self.shareCount.font = [UIFont systemFontOfSize:12];
        self.shareCount.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.shareCount];
        UIImageView *imageView4 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"moreicon_textpage"]];
        imageView4.layer.cornerRadius = 36/2;
        [self.contentView addSubview:imageView4];
        [imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(36, 36));
            make.centerY.mas_equalTo(self.diggCount);
            make.left.mas_equalTo(self.commentCount.mas_right).mas_equalTo(kContentImage);
        }];
        [self.shareCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView4.mas_right).mas_equalTo(5);
            make.centerY.mas_equalTo(self.diggCount);
        }];

        
    }
    return self;
}

@end


@interface ShiPinViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)ShiPinViewModel *shipinVM;
@property(nonatomic,strong)JDFPeekabooCoordinator *scrollCoordinator;
@end

@implementation ShiPinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kRGBColor(216, 213, 216);
    [self.tableView.header beginRefreshing];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(ShiPinViewModel *)shipinVM{
    if (!_shipinVM) {
        _shipinVM = [ShiPinViewModel new];
    }
    return _shipinVM;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[ShiPinCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.backgroundColor = kRGBColor(216, 213, 216);
        [self.view addSubview:_tableView];
        
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.shipinVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
        
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.shipinVM getMoreDataCompletionHandle:^(NSError *error) {
                [self.tableView.footer endRefreshing];
                [self.tableView reloadData];
            }];
        }];
    }
    return _tableView;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.shipinVM.rowNumber;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShiPinCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.image1 setImage:[UIImage imageNamed:@"hoticon_textpage"]];
    
    [cell.userIcon.imageView setImageWithURL:[self.shipinVM userIconForRow:indexPath.section]];
    cell.userID.text = [self.shipinVM nameForRow:indexPath.section];
    cell.content.text = [self.shipinVM contentForRow:indexPath.section];
    [cell.categoryName setTitle:[self.shipinVM categoryNameForRow:indexPath.section] forState:0];
    [cell.videoBtn setBackgroundImageForState:0 withURL:[self.shipinVM videoIconURLForRow:indexPath.section]];
    cell.videoURL = [self.shipinVM videoURLForRow:indexPath.section];
    cell.diggCount.text = [self.shipinVM diggCountForRow:indexPath.section];
    cell.buryCount.text = [self.shipinVM buryCountForRow:indexPath.section];
    cell.commentCount.text = [self.shipinVM commentCountForRow:indexPath.section];
    cell.shareCount.text = [self.shipinVM shareCountForRow:indexPath.section];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 2;
}


@end
