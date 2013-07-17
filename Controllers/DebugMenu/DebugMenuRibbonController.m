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

-(void) hideDebugMenu;

-(void) showDebugMenu;

-(void) slideDownDebugMenu;

-(void) slideUpDebugMenu;

-(void) slideDownRibbon;

-(void) slideUpRibbon;

@end



@implementation DebugMenuRibbonController

@synthesize ribbon;

static DebugMenuRibbonController *sharedDebugMenuRibbonController = nil;		// Singleton

#pragma mark -
#pragma mark Singleton Methods
#pragma mark -

+ (DebugMenuRibbonController*)activateDebugMenu
{
    @synchronized( self ){
        if (sharedDebugMenuRibbonController == nil) {
			DebugMenuTableViewController *tableViewController = [[DebugMenuTableViewController alloc] initWithStyle:UITableViewStylePlain];
			sharedDebugMenuRibbonController = [[self alloc] initWithRootViewController:tableViewController];
			sharedDebugMenuRibbonController.navigationBar.tintColor = [UIColor blackColor];
			tableViewController.delegate = sharedDebugMenuRibbonController;
			
			[sharedDebugMenuRibbonController addDebugIndicatorToWindow];
		}
    }
    return sharedDebugMenuRibbonController;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (sharedDebugMenuRibbonController == nil) {
            sharedDebugMenuRibbonController = [super allocWithZone:zone];
            return sharedDebugMenuRibbonController;  // assignment and return on first allocation
        }
    }
    return nil; //on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

//- (id)retain
//{
//    return self;
//}
//
//- (unsigned)retainCount
//{
//    return UINT_MAX;  //denotes an object that cannot be released
//}
//
//- (oneway void)release
//{
//    //do nothing
//}
//
//- (id)autorelease
//{
//    return self;
//}

#pragma mark -
#pragma mark Controller Methods
#pragma mark -



+(void) moveRibbonToTopOfWindow{
	[sharedDebugMenuRibbonController.ribbon.superview bringSubviewToFront:sharedDebugMenuRibbonController.ribbon];
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

-(void) shakeDidHappen{
	[self slideDownRibbon];
}

-(void) didClickRibbon{
	[self showDebugMenu];
}

#pragma mark Utility functions

-(void) slideDownRibbon{
    [DebugMenuRibbonController moveRibbonToTopOfWindow];
	if( _ribbonIsDown ) return;
	
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
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shakeDidHappen) name:kMotionShakeNotification object:nil];
	
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
