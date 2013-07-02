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

@synthesize webView, webView2, mainMenuViewController, address1, address2, engineSelect;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self startUp:nil];
    [webView2 setHidden:TRUE];
}


-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
//    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style: UIBarButtonItemStylePlain target: self action:@selector(switchToMainMenuView:)];
    self.navigationItem.leftBarButtonItem = backButton;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)switchToMainMenuView:(id)sender
{
    self.mainMenuViewController = [[UIViewController alloc] initWithNibName:@"MainMenuViewController" bundle:nil];
    [self.navigationController popViewControllerAnimated:YES];
    [self.mainMenuViewController setTitle:@"MultiSearch"];
}


//Does web view thingies.
-(BOOL)webView: (UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
    {
        NSURL *url = [request URL];
        
        if([[url scheme] isEqualToString:@"http"])
        {
            [self startUp:nil];
        }
        return NO;
    }
    return YES;
}


//Takes fixed url and fires the request.
-(void)startUp:(id)sender
{
    [webView loadRequest:[self getRequest:address1]];
    [webView2 loadRequest:[self getRequest:address2]];
}

-(NSURLRequest*)getRequest:(NSString *)tempAddress
{
    NSURL *url = [NSURL URLWithString:tempAddress];
    return [NSURLRequest requestWithURL:url];
}

- (IBAction)changePage:(id)sender
{
    if (engineSelect.currentPage == 0){
        [webView setHidden:FALSE];
        [webView2 setHidden:TRUE];
    }
    else if (engineSelect.currentPage == 1){
        [webView2 setHidden:FALSE];
        [webView setHidden:TRUE];
    }
}


@end
