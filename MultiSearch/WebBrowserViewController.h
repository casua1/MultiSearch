//
//  ViewController.h
//  MultiSearch
//
//  Created by iD Student on 6/27/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFJSONRequestOperation.h"

@interface WebBrowserViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (nonatomic, strong) IBOutlet UITextField *addressBar;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *term;

-(IBAction)goAddress:(id)sender;
-(BOOL)webView: (UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
-(IBAction)getSearchTerm:(id)sender;
-(void)setAddress;
-(void)fixTerm;
@end
