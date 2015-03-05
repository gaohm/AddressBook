//
//  HMAddressTableViewController.m
//  RaiYeeAdreessBook
//
//  Created by ghm on 15-1-21.
//  Copyright (c) 2015年 HM. All rights reserved.
//

#import "HMAddressTableViewController.h"
#import "HMMember.h"
#import "HMDetailViewController.h"
//#import "SearchCoreManager.h"
//#import "ContactPeople.h"

#define kHighOfLable 44

@interface HMAddressTableViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (nonatomic,strong) NSMutableArray      *members;
@property (nonatomic,strong) NSMutableArray      *membersList;
@property (nonatomic,strong) UISearchBar         *searchBar;
@property (nonatomic,strong) NSMutableArray      *searchByName;
@property (nonatomic,strong) NSMutableArray      *searchByPhone;
@property (nonatomic,strong) NSMutableDictionary *contactDic;

@end

@implementation HMAddressTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.contactDic = [NSMutableDictionary dictionary];
    self.searchByName = [NSMutableArray array];
    self.searchByPhone = [NSMutableArray array];
    
/*    for (int i = 0; i < self.membersList.count; i ++) {
        ContactPeople *contact = [[ContactPeople alloc] init];
        contact.localID = [NSNumber numberWithInt:i];
        contact.name = self.membersList[i][@"name"];
        contact.phoneArray = nil;
       [[SearchCoreManager share] AddContact:contact.localID name:contact.name phone:contact.phoneArray];
        [self.contactDic setObject:contact forKey:contact.localID];
    }
//    [self searchBarInit];
 */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

// 通过重写get方法完成赋值
- (NSMutableArray *)members {
    if (_members == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"txl3" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        _members = [NSMutableArray arrayWithArray:arr];
    }
    return _members;
}

- (NSMutableArray *)membersList {
    if (_membersList == nil) {
        _membersList = [NSMutableArray array];
        for (NSArray *arr in self.members) {
            [_membersList addObjectsFromArray:arr];
        }
    }
    return _membersList;
}



#pragma mark - 搜索工具条的实现
/*
- (void)searchBarInit {
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 310.0f, 44.0f)] ;
    
    self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    self.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.searchBar.keyboardType = UIKeyboardTypeTwitter;
    self.searchBar.backgroundColor=[UIColor clearColor];
    self.searchBar.translucent=YES;
    self.searchBar.placeholder=@"搜索姓名";
    self.searchBar.clearsContextBeforeDrawing = YES;
    self.searchBar.delegate = self;
    self.searchBar.barStyle=UIBarStyleDefault;
    
    self.tableView.tableHeaderView = self.searchBar;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    // 添加一个取消按钮到框的右边
    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancleBtn.frame = CGRectMake(250, 0, 70, 44);
    cancleBtn.backgroundColor = [UIColor clearColor];
    [cancleBtn addTarget:self action:@selector(cancelSearch:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tableView.tableHeaderView addSubview:cancleBtn];
}
- (void)cancelSearch:(UIButton *)cancelBtn {
    [self.searchBar resignFirstResponder];
    [cancelBtn removeFromSuperview];
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    DLog(@"%@",searchText);
    [[SearchCoreManager share] Search:searchText searchArray:nil nameMatch:self.searchByName phoneMatch:self.searchByPhone];

    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i< self.searchByName.count ; i++) {
        int t = [self.searchByName[i] intValue];
        [arr addObject:self.membersList[t]];
    }
    [_members removeAllObjects];
    if (arr.count == _membersList.count) {
        _members = nil;
    }else
    [self.members addObject:arr];
    [self.tableView reloadData];
}
*/

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.members.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    NSArray *membersOfDepartment = self.members[section];
    return membersOfDepartment.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"raiyee";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    NSDictionary *dir = self.members[indexPath.section][indexPath.row];
    HMMember *member = [HMMember initWithDict:dir];
    cell.textLabel.text = member.name;
    cell.detailTextLabel.text = member.telNum;
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.imageView.image = [UIImage circleImageWithName:@"txl" borderWidth:20 borderColor:[UIColor whiteColor]];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.members.count <= 1) {
        return nil;
    }
    NSDictionary *dir = self.members[section][0];
    return dir[@"department"];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HMDetailViewController *detailVC = [[HMDetailViewController alloc] init];
    NSDictionary *dir = self.members[indexPath.section][indexPath.row];
    HMMember *member = [HMMember initWithDict:dir];

    detailVC.member = member;
    [self.navigationController pushViewController:detailVC animated:YES];
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    NSArray *arr = @[@"总经理",@"人事部",@"财务部",@"行政部",@"研发部"];
//    return arr;
//}

@end
