    //
//  DebugMenuController.m
//  Tunerfish
//
//  Created by Josh Kennedy on 9/2/11.
//  Copyright 2011 Plaxo. All rights reserved.
//

#import "DebugMenuRibbonController.h"
#import <QuartzCore/QuartzCore.h>
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
{
	BOOL _ribbonIsDown;
}
@property (nonatomic, strong) UIButton* ribbon;
@end

@implementation DebugMenuRibbonController

#pragma mark -
#pragma mark Singleton Methods
#pragma mark -
static DebugMenuRibbonController *_sharedDebugMenuRibbonController = nil;

+ (instancetype)initWithDelegate:(id <UITableViewDelegate, UITableViewDataSource>)delegate
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITableViewController *tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
        _sharedDebugMenuRibbonController = [[self alloc] initWithRootViewController:tableViewController];
        tableViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone handler:^(id sender) {
            [_sharedDebugMenuRibbonController hideDebugMenu];
        }];
        tableViewController.tableView.delegate = delegate;
        tableViewController.tableView.dataSource = delegate;
        [_sharedDebugMenuRibbonController addDebugIndicatorToWindow];
    });
    return _sharedDebugMenuRibbonController;
}

+ (instancetype)sharedDebugMenu;
{
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
    __weak id weakSelf = self;
	[self.ribbon addEventHandler:^(id sender) {
        [weakSelf showDebugMenu];
    } forControlEvents:UIControlEventTouchUpInside];
	
	self.view.frame = CGRectWithNewOriginY( self.view.frame, -applicationFrame.size.height );

	[window addSubview: self.ribbon];
	[window addSubview: self.view];
    
	[self hideDebugMenu];
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

-(void) hideDebugMenu
{
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
