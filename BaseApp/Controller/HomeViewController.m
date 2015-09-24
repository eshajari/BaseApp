//
//  ViewController.m
//  BaseApp
//
//  Created by IMI-MAC-01 on 24/09/15.
//  Copyright (c) 2015 IMI-MAC-01. All rights reserved.
//

#import "HomeViewController.h"
//#import "UIViewController+MMDrawerController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddMenuButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
