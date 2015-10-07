//
//  DetailProjectController.m
//  BaseApp
//
//  Created by IMI-MAC-01 on 07/10/15.
//  Copyright © 2015 IMI-MAC-01. All rights reserved.
//

#import "DetailProjectController.h"

@interface DetailProjectController ()

@end

@implementation DetailProjectController
@synthesize arrAppList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TABLE VIEW

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrAppList count];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellName = @"DetailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    
    UILabel *lblName = (UILabel*)[cell viewWithTag:1];
    NSMutableDictionary *dic = [arrAppList objectAtIndex:indexPath.row];
    lblName.text = [dic objectForKey:@"appName"];  // @"Project Iconica"; //

    
    /*
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
    */
    return cell;
}



-(void)LoginToInstagram
{
    
    
}

@end
