//
//  MenuViewController.m
//  BaseApp
//
//  Created by IMI-MAC-01 on 24/09/15.
//  Copyright (c) 2015 IMI-MAC-01. All rights reserved.
//

#import "MenuViewController.h"
#import "UIImage+ImageEffects.h"


#define KMenuArray     [NSArray arrayWithObjects:@"Home",@"Projects", nil]
#define KMenuIcons     [NSArray arrayWithObjects:@"Home", @"treeIcon",nil]

@interface MenuViewController ()
{
    NSMutableArray *ArrMenuNames,*ArrMenuIcons;
}
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ArrMenuNames = [NSMutableArray new];
    [ArrMenuNames addObjectsFromArray:KMenuArray];
    ArrMenuIcons = [NSMutableArray new];
    [ArrMenuIcons addObjectsFromArray:KMenuIcons];
    self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view.
    
    if (!UIAccessibilityIsReduceTransparencyEnabled()) {
        //UIImageView *imgVw = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SideViewimage.jpg"]];
        self.bgImage.backgroundColor = [UIColor clearColor];
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurEffectView.frame = self.bgImage.bounds;
        blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self.bgImage addSubview:blurEffectView];
    }
    else {
        self.view.backgroundColor = [UIColor blackColor];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TABLE VIEW

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellName = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    
    UILabel *lblName = (UILabel*)[cell viewWithTag:2];
    lblName.text = [ArrMenuNames objectAtIndex:indexPath.row];
    
    UIImageView *img = (UIImageView*)[cell viewWithTag:1];
    img.image = [UIImage imageNamed:[ArrMenuIcons objectAtIndex:indexPath.row]];
    // UIToolbar *translucentView = [[UIToolbar alloc] initWithFrame:CGRectZero];
    // cell.backgroundView = translucentView;
    
    UIView *bgVw = [[UIView alloc] initWithFrame:cell.frame];
    bgVw.alpha = 0.2;
    [bgVw  setBackgroundColor:[UIColor brownColor]];
    
    cell.selectedBackgroundView = bgVw;
    cell.backgroundColor = [UIColor clearColor];
    //    [[UITableView appearance] setBackgroundColor:[UIColor clearColor]];
    //    [[UITableView appearance] setBackgroundView:[[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"SideViewimage.jpg"] applyLightEffect]]];
    //    [[UITableView appearance] setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SideViewimage.jpg"]]];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *nav;
    switch (indexPath.row) {
        case 0:
        {
            HomeViewController *centreVw = InitViewStory_with(@"Main", @"ID_Home");
            //[self.mm_drawerController setCenterViewController:centreVw withCloseAnimation:YES completion:nil];
            nav = [[UINavigationController alloc] initWithRootViewController:centreVw];
        }
        break;
            
        case 1:
        {

            ProjectViewController *centreVw = InitViewStory_with(@"Main", @"ID_Proj");
            nav = [[UINavigationController alloc] initWithRootViewController:centreVw];
        }
        break;
            
        default:
            break;
    }
    
    [self.mm_drawerController setCenterViewController:nav withCloseAnimation:YES completion:nil];
    
}




@end
