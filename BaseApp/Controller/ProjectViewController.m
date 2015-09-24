//
//  ProjectViewController.m
//  BaseApp
//
//  Created by IMI-MAC-01 on 24/09/15.
//  Copyright (c) 2015 IMI-MAC-01. All rights reserved.
//

#import "ProjectViewController.h"

@interface ProjectViewController ()

@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddMenuButton];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TABLE VIEW

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 14;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellName = @"FeedCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    
//    UILabel *lblName = (UILabel*)[cell viewWithTag:2];
//    lblName.text = @"Project Iconica"; //[ArrMenuNames objectAtIndex:indexPath.row];
//    
    
    UIView *bgView = (UIView*)[cell viewWithTag:2];
    //bgView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    //bgView.layer.borderWidth = 1.0;
    bgView.layer.cornerRadius = 8.0;
    bgView.layer.masksToBounds = YES;
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:bgView.bounds];
    bgView.layer.masksToBounds = NO;
    bgView.layer.shadowColor = [UIColor blackColor].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    bgView.layer.shadowOpacity = 0.1f;
    bgView.layer.shadowPath = shadowPath.CGPath;
    
    //UIImageView *img = (UIImageView*)[cell viewWithTag:1];
    //img.image = [UIImage imageNamed:[ArrMenuIcons objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - User Methods

-(void)AddMenuButton
{
    UIBarButtonItem *btnMenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MenuIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(OpenDrawer)];
    btnMenu.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = btnMenu;
    self.navigationController.navigationBar.barTintColor = App_COL_ThemeBlue;
}


-(void)OpenDrawer
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


@end
