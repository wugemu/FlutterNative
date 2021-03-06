//
//  ViewController.m
//  IosLangTest
//
//  Created by jessie on 2018/3/14.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "MyViewController.h"
#import "MainCell.h"
#import "WebViewVC.h"

@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UILabel *label;
    UIImageView *imgView;
    UITableView *mTable;
}
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)initView{
    [self addTitle:@"测试" withBackBtn:YES withRightBtn:nil];//添加自定义标题
    [self initLoading];//初始化网络加载动画
    
    UIButton *btnJump = [UIButton buttonWithType:UIButtonTypeCustom];
    btnJump.frame = CGRectMake(0, BEGIN_Y, 100, 40);
    btnJump.backgroundColor=UIColor.blackColor;
    [btnJump addTarget:self action:@selector(jumpFlutter) forControlEvents:UIControlEventTouchUpInside];
    [btnJump setTitle:@"跳转Flutter页面" forState:UIControlStateNormal];
    [btnJump setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    btnJump.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [self.view addSubview:btnJump];
    
    label=[[UILabel alloc] init];
    label.frame=CGRectMake(0, btnJump.bottom, 100, 30);
    label.text=@"测试1111";
    [self.view addSubview:label];
    
    imgView=[[UIImageView alloc] init];
    imgView.frame=CGRectMake(50, label.bottom, 300, 250);
     __weak typeof(self) weakSelf = self;
    imgView.onTouchTapBlock = ^(UIImageView * imageView){
        WebViewVC *vc=[[WebViewVC alloc] init];
        vc.url=@"http://www.weinihaigou.com/m-html/index/index.html?title=唯妮海购";
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    [self.view addSubview:imgView];
    
    mTable = [[UITableView alloc] initWithFrame:CGRectMake(0, imgView.bottom, 300, 100) style:UITableViewStylePlain];
    mTable.delegate = self;
    mTable.dataSource = self;
    mTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    mTable.showsVerticalScrollIndicator = NO;
    mTable.scrollEnabled = YES;
    [self.view addSubview:mTable];
    
}
-(void)initPresenter{
    presenter=[[ViewControllPresenter alloc] initWithDelegate:self class:[MainModel class]];
}
-(void)initData{
    
}

#pragma mark------tableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[(MainModel*)presenter.model array] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"MainCell";
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.nameLab.text=[(MainModel*)presenter.model array][indexPath.row];
    return cell;
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    MainModel *model=(MainModel*)presenter.model;
    //model改变 改变View
    if(model.tag==1){
        [imgView setPicImageStr:@"http://img.zcool.cn/community/01b0d857b1a34d0000012e7e87f5eb.gif" size:imgView.size];
    }else if(model.tag==2){
        [mTable reloadData];
    }else if(model.tag==3){
        [LangUtil showToastUseMBHub:self.view showText:@"请求失败"];
    }
}

//跳转flutter页面
-(void)jumpFlutter{
    [FlutterUtil pushFlutterVC:self withRoute:@"https://m.sudian178.com"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
