//
//  ViewController.h
//  MultiSearch
//
//  Created by iD Student on 6/27/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebBrowserViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (strong, nonatomic) UIViewController *mainMenuViewController;
@property (strong, nonatomic) NSString *address;

-(BOOL)webView: (UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;


@end
