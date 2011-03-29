//
//  RightViewController.m
//  SaveJapan
//
//  Created by jari on 3/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RightViewController.h"


@implementation RightViewController

@synthesize messageLabel;

@synthesize popover = _popover;
@synthesize toolbar = _toolbar;

@synthesize colorPicker = _colorPicker;
@synthesize colorPickerPopover = _colorPickerPopover;

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


//####ColorPickerDelegate####//
- (void)colorSelected:(NSString *)color{
    if ([color compare:@"Red"] == NSOrderedSame) {
        messageLabel.textColor = [UIColor redColor];
    }else if ([color compare:@"Blue"] == NSOrderedSame ) {
        messageLabel.textColor = [UIColor blueColor];
    }else if ([color compare:@"Yellow"] == NSOrderedSame ) {
        messageLabel.textColor = [UIColor yellowColor];
    }
    [self.colorPickerPopover dismissPopoverAnimated:YES];
}

- (void)setColorButtonTapped{
    if (_colorPicker == nil) {
        self.colorPicker = [[[ColorPickerController alloc] initWithStyle:UITableViewStylePlain] autorelease];
        _colorPicker.delegate = self;
        self.colorPickerPopover = [[[UIPopoverController alloc] initWithContentViewController:_colorPicker] autorelease];
    }
    [self.colorPickerPopover presentPopoverFromBarButtonItem: colorButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}


//####SplitViewDelegate####//
- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc{
    
    barButtonItem.title = @"lyrics";
    NSMutableArray *items = [[_toolbar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
    [_toolbar setItems:items animated:YES];
    [items release];
    self.popover = pc;
}

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    
    NSMutableArray *items = [[_toolbar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [_toolbar setItems:items animated:YES];
    [items release];
    self.popover = nil;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 150, self.view.bounds.size.height/2 - 50, 300, 100)];
    messageLabel.text = @"Punk";
    messageLabel.textAlignment = UITextAlignmentCenter;
    messageLabel.textColor =  [UIColor colorWithRed:0.25 green:0.8 blue:0.25 alpha:1.0];
    messageLabel.backgroundColor = [UIColor blackColor];
    messageLabel.font = [UIFont systemFontOfSize:64.0f];
    
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:messageLabel];
    
    self.toolbar = [[UIToolbar alloc] init];
    self.toolbar.barStyle = UIBarStyleBlack;
    [self.toolbar sizeToFit];
    self.toolbar.translucent = YES;
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    colorButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonItemStylePlain target:self action:@selector(setColorButtonTapped)];
    
    NSArray *buttons = [NSArray arrayWithObjects:space, colorButton, nil];
    [self.toolbar setItems:buttons animated:YES];
    
    [self.view addSubview:self.toolbar];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
