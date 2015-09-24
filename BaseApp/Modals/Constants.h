//
//  Constants.h
//  BaseApp
//
//  Created by IMI-MAC-01 on 24/09/15.
//  Copyright (c) 2015 IMI-MAC-01. All rights reserved.
//

#ifndef BaseApp_Constants_h
#define BaseApp_Constants_h


#define SCREEN_WIDTH (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define SCREEN_HEIGHT (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define APPDELEGATE_INSTANCE  (AppDelegate *)[UIApplication sharedApplication].delegate



#pragma mark - FONTS

#define FONT_NAME @"CaviarDreams"

#define App_Font(x)  [UIFont fontWithName:@"CaviarDreams" size:x]
#define App_Font_BOLD(x)  [UIFont fontWithName:@"CaviarDreams-Bold" size:x]

#pragma mark - APP COLOR

#define App_COL_ThemeBlue [UIColor colorWithRed:230/255.0 green:100/255.0 blue:110/255.0 alpha:1.0]


#pragma mark - APP CONST

#define APP_NAME @"MyIntro"
#define APP_VERSION = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
#define APP_BUILD = [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey];


#pragma mark - UI METHODS

#define mainStory @"Main"
#define InitViewStory_with(story,vwID) [[UIStoryboard storyboardWithName:story bundle: nil]  instantiateViewControllerWithIdentifier:vwID];




#endif
