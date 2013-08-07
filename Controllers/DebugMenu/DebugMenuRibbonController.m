    //
//  DebugMenuController.m
//  Tunerfish
//
//  Created by Josh Kennedy on 9/2/11.
//  Copyright 2011 Plaxo. All rights reserved.
//

#import "DebugMenuRibbonController.h"
#import <QuartzCore/QuartzCore.h>
#import "TFLargeGreenButton.h"
#import "DebugMenuTableViewController.h"
#import "HBRCGRectHelper.h"

#define RIBBON_HEIGHT 60
#define RIBBON_WIDTH 30
#define	RIBBON_PEAK_HEIGHT 10
#define RIBBON_DROP_HEIGHT 30
#define RIBBON_RIGHT_MARGIN 10

#define CLOSE_BUTTON_HEIGHT 20
#define CLOSE_BUTTON_WIDTH 50
#define CLOSE_BUTTON_MARGIN 5


@interface DebugMenuRibbonController()

@end

@implementation DebugMenuRibbonController

#pragma mark -
#pragma mark Singleton Methods
#pragma mark -
static DebugMenuRibbonController *_sharedDebugMenuRibbonController = nil;

+ (instancetype)sharedDebugMenu;
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DebugMenuTableViewController *tableViewController = [[DebugMenuTableViewController alloc] initWithStyle:UITableViewStylePlain];
        _sharedDebugMenuRibbonController = [[self alloc] initWithRootViewController:tableViewController];
        _sharedDebugMenuRibbonController.navigationBar.tintColor = [UIColor blackColor];
        tableViewController.delegate = _sharedDebugMenuRibbonController;
        [_sharedDebugMenuRibbonController addDebugIndicatorToWindow];
    });
    
    return _sharedDebugMenuRibbonController;
}


#pragma mark -
#pragma mark Controller Methods
#pragma mark -

- (void) moveRibbonToTopOfWindow{
	[_sharedDebugMenuRibbonController.ribbon.superview bringSubviewToFront:_sharedDebugMenuRibbonController.ribbon];
}

-(void) addDebugIndicatorToWindow{
	UIWindow *window = [[UIApplication sharedApplication] keyWindow];
	NSUInteger statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
	
	CGRect applicationFrame = [UIScreen mainScreen].applicationFrame;
	CGRect ribbonFrame = CGRectMake( applicationFrame.size.width - RIBBON_WIDTH - RIBBON_RIGHT_MARGIN, 
									RIBBON_PEAK_HEIGHT - RIBBON_HEIGHT + (int)statusBarHeight, 
									RIBBON_WIDTH, 
									RIBBON_HEIGHT );
	
	self.ribbon = [UIButton buttonWithType: UIButtonTypeCustom];
	[self.ribbon setImage:[UIImage imageNamed:@"ribbon"] forState:UIControlStateNormal];
	self.ribbon.userInteractionEnabled = NO; // Off until shake guesture drops the ribbon into view
	self.ribbon.frame = ribbonFrame;
	[self.ribbon addTarget:self action:@selector(didClickRibbon) forControlEvents:UIControlEventTouchUpInside];
	
	self.view.frame = CGRectWithNewOriginY( self.view.frame, -applicationFrame.size.height );

	[window addSubview: self.ribbon];
	[window addSubview: self.view];
    
	[self hideDebugMenu];
}

#pragma mark - DebugMenuDelegate

-(void) didClickExit{
	[self slideUpDebugMenu];
}

#pragma mark - User Driven Actions

-(void) didClickClose{
	[self hideDebugMenu];
}

-(void) didClickRibbon{
	[self showDebugMenu];
}

#pragma mark Utility functions

-(void) showHideRibbon{
    [self moveRibbonToTopOfWindow];
	if( _ribbonIsDown ) {
        [self slideUpRibbon];
    }
	
	self.ribbon.userInteractionEnabled = YES;
	_ribbonIsDown = YES;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	
	CGRect frame = self.ribbon.frame;
	frame.origin.y = frame.origin.y + RIBBON_DROP_HEIGHT;
	self.ribbon.frame = frame;
	
	[UIView commitAnimations];

	[self performSelector:@selector(slideUpRibbon) withObject:nil afterDelay:3.0];
}

-(void) slideUpRibbon{
	self.ribbon.userInteractionEnabled = NO;
	_ribbonIsDown = NO;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	
	CGRect frame = self.ribbon.frame;
	
	NSUInteger statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
	frame.origin.y = RIBBON_PEAK_HEIGHT - RIBBON_HEIGHT + (int)statusBarHeight;
	self.ribbon.frame = frame;
	
	[UIView commitAnimations];
}

-(void) showDebugMenu{
	[self.view.superview bringSubviewToFront:self.view];
	[self slideDownDebugMenu];
}

-(void) slideDownDebugMenu{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDelegate: self];
	[UIView setAnimationDidStopSelector:@selector(fadeInOverlay)];
	
	// slide the menu in
	CGRect debugMenuFrame = self.view.frame; 
	debugMenuFrame.origin.y = 0;
	self.view.frame = debugMenuFrame;

	[UIView commitAnimations];
}

-(void) hideDebugMenu{
	self.ribbon.userInteractionEnabled = NO;
	[self slideUpDebugMenu];
}

-(void) slideUpDebugMenu{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];

	NSUInteger statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;

	CGRect debugMenuFrame = self.view.frame; 
	debugMenuFrame.origin.y = 0 - (debugMenuFrame.size.height + statusBarHeight);
	self.view.frame = debugMenuFrame;
	[UIView commitAnimations];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
	self.ribbon = nil;
}

@end
