//
//  MainMenuViewController.m
//  MultiSearch
//
//  Created by iD Student on 7/1/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import "MainMenuViewController.h"
#import "WebBrowserViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

@synthesize webBrowserViewController, testButton, address, term, pickerView, column1, column2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    column1 = [[NSMutableArray alloc] initWithObjects:@"Google", @"Yahoo", @"Bing", @"Ask", @"AOL", @"Dogpile", @"Duck Duck Go", nil];
    column2 = [[NSMutableArray alloc] initWithObjects:@"Google", @"Yahoo", @"Bing", @"Ask", @"AOL", @"Dogpile", @"Duck Duck Go", nil];

}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 2;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    if (component == 0)
    {
        return [column1 count];
    }
    else
    {
        return [column2 count];
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    if (component == 0)
    {
        return [column1 objectAtIndex:row];
    }
    else
    {
        return [column2 objectAtIndex:row];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationItem setTitle:@"Main"];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)switchToWebBrowserView:(id)sender
{
    self.webBrowserViewController = [[WebBrowserViewController alloc] initWithNibName:@"WebBrowserViewController_iPhone" bundle:nil];
    webBrowserViewController.address = address;
    [self.navigationController pushViewController:self.webBrowserViewController animated:YES];
    [self.webBrowserViewController setTitle:@"Search Term"];
}


//Takes in the search term from the user.
-(IBAction)getSearchTerm:(id)sender;
{
    term = [sender text];
    [sender resignFirstResponder];
    [self fixTerm];
    [self setAddress];
    [self switchToWebBrowserView:nil];
}


//Formats the user search term to be compatible with the url.
-(void)fixTerm
{
    NSString *string = term;
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@" " options:NSRegularExpressionCaseInsensitive error:&error];
    term = [regex stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:@"+"];
}


//Combines search term with the base url.
-(void)setAddress
{
    NSString *selection1 = [column1 objectAtIndex:[pickerView selectedRowInComponent:0]];
    NSString *selection2 = [column2 objectAtIndex:[pickerView selectedRowInComponent:1]];
    NSString *base1 = [self returnBase:selection1 data:column1];
    NSString *base2 = [self returnBase:selection2 data:column2];
    address = [base1 stringByAppendingString:term];
}


//Returns URL base based on user search engine choice, selected via pickerview.
-(NSString *)returnBase:(NSString *) selection data:(NSMutableArray *) column
{
    if (selection == [column objectAtIndex:0])
    {
        return @"http://google.com/search?q=";
    }
    else if (selection == [column objectAtIndex:1])
    {
        return @"http://search.yahoo.com/search?q=";
    }
    else if (selection == [column objectAtIndex:2])
    {
        return @"http://bing.com/search?q=";
    }
    else if (selection == [column objectAtIndex:3])
    {
        return @"http://ask.com/web?q=";
    }
    else if (selection == [column objectAtIndex:4])
    {
        return @"http://search.aol.com/aol/search?q=";
    }
    else if (selection == [column objectAtIndex:5])
    {
        return @"http://dogpile.com/search/web?q=";
    }
    else
    {
        return @"http://duckduckgo.com/?q=";
    }
}

@end
