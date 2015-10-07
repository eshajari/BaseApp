//
//  ProjectViewController.m
//  BaseApp
//
//  Created by IMI-MAC-01 on 24/09/15.
//  Copyright (c) 2015 IMI-MAC-01. All rights reserved.
//

#import "ProjectViewController.h"
#include <objc/runtime.h>
#import "DetailProjectController.h"

@interface LSApplicationProxy : NSObject // LSBundleProxy <NSSecureCoding>
@property(readonly, nonatomic) NSString *applicationDSID;
@property(readonly, nonatomic) NSString *applicationIdentifier;
@property(readonly, nonatomic) NSString *applicationType;
@property(readonly, nonatomic) BOOL isContainerized;
@property(readonly, nonatomic) NSString *shortVersionString;
@property(readonly, nonatomic) NSMutableArray *groupIdentifiers;
- (long)bundleModTime;
- (id)localizedName;
- (id)resourcesDirectoryURL;
@end


#define KArrProjName [NSArray arrayWithObjects:@"App List", @"Battry Life",@"Instagram",nil]

@interface ProjectViewController ()
{
    NSMutableArray *ArrProjName;
}
@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddMenuButton];
    ArrProjName = [NSMutableArray new];
    [ArrProjName addObjectsFromArray:KArrProjName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - TABLE VIEW

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ArrProjName count];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellName = @"FeedCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    
    UILabel *lblName = (UILabel*)[cell viewWithTag:3];
    lblName.text = @"Project Iconica"; //[ArrMenuNames objectAtIndex:indexPath.row];
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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            DetailProjectController *detail = InitViewStory_with(@"Main", @"ID_DETAIL");
            detail.arrAppList = [self GetAppInstalledList];
            [self.navigationController pushViewController:detail animated:YES];
        }
            break;

        case 1:
            
            break;
            
            
        default:
            break;
    }
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


-(NSMutableArray*)GetAppInstalledList
{
        NSMutableArray *arrApplist = [NSMutableArray new];
        
        Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
        NSObject* workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
        NSArray *newarr = [[NSArray alloc] initWithObjects:[workspace performSelector:@selector(allApplications)], nil];
    
        NSMutableArray *currentAppArr = [NSMutableArray new];
        [currentAppArr addObjectsFromArray:[newarr objectAtIndex:0]];
        
        for (LSApplicationProxy *prox  in currentAppArr) {
            NSMutableDictionary *appDetail = [NSMutableDictionary new];
            [appDetail setObject:prox.localizedName forKey:@"appName"];
            [appDetail setObject:prox.applicationIdentifier forKey:@"packageName"];
            
            [arrApplist addObject:appDetail];
        }

    return arrApplist;
}

@end
