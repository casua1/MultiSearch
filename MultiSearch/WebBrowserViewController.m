//
//  ViewController.m
//  MultiSearch
//
//  Created by iD Student on 6/27/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import "WebBrowserViewController.h"

@interface WebBrowserViewController ()

@end

@implementation WebBrowserViewController

@synthesize webView, addressBar, address, term;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    NSURL *url = [NSURL URLWithString:address];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    [webView loadRequest:request];

    NSURL *url = [NSURL URLWithString:@"http://httpbin.org/ip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"IP Address: %@", [JSON valueForKeyPath:@"origin"]);
    } failure:nil];
    
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)goAddress:(id)sender
{
    NSURL *url = [NSURL URLWithString:address];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
}

-(BOOL)webView: (UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
    {
        NSURL *url = [request URL];
        
        if([[url scheme] isEqualToString:@"http"])
        {
            [self goAddress:nil];
        }
        return NO;
    }
    return YES;
}

-(IBAction)getSearchTerm:(id)sender;
{
    term = [sender text];
    NSLog(@"%@", term);
    [self fixTerm];
    [self setAddress];
    [self goAddress:(id)sender];
}

-(void)fixTerm
{
    NSString *string = term;
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@" " options:NSRegularExpressionCaseInsensitive error:&error];
    term = [regex stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:@"+"];
}

-(void)setAddress
{
    NSString *base = @"http://google.com/search?q=";
    address = [base stringByAppendingString:term];
    NSLog(@"%@",address);
}

@end
