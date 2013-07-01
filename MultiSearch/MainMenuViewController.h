//
//  MainMenuViewController.h
//  MultiSearch
//
//  Created by iD Student on 7/1/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebBrowserViewController.h"

@class WebBrowserViewController;

@interface MainMenuViewController : UIViewController


@property (strong, nonatomic) WebBrowserViewController *webBrowserViewController;
@property (strong, nonatomic) UIButton *testButton;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *term;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) NSMutableArray *column1;
@property (strong, nonatomic) NSMutableArray *column2;


-(IBAction)switchToWebBrowserView:(id)sender;
-(IBAction)getSearchTerm:(id)sender;

@end
