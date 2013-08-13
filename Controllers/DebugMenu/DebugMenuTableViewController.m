//
//  DebugMenuTableViewController.m
//  Tunerfish
//
//  Created by Josh Kennedy on 9/7/11.
//  Copyright 2011 Plaxo. All rights reserved.
//

#import "DebugMenuTableViewController.h"
#import "DebugMenuDictionaryViewerController.h"
#import <InAppSettingsKit/IASKAppSettingsViewController.h>
#import "asl.h"
#import "SBBark.h"

@interface DebugMenuTableViewController(Private)

-(void) crashAndDie;

@end


@implementation DebugMenuTableViewController

@synthesize delegate;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	
	self.navigationItem.title = @"Debug";
	
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Exit" style:UIBarButtonItemStylePlain target:self action:@selector(didClickExit)];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Refresh" style:UIBarButtonItemStylePlain target:self action:@selector(didClickRefresh)];
	
	self.tableView.scrollsToTop = NO;
	
    [super viewDidLoad];
}

-(void) didClickExit{
	[delegate didClickExit];
}

-(void) didClickRefresh
{
	[self.tableView reloadData];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		cell.userInteractionEnabled = YES;
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    switch (indexPath.row) {
			
        case 0:
            cell.textLabel.text = @"Feedback";
            break;
            
        case 1:
            cell.textLabel.text = @"Global Storage Explorer";
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
            
        case 2:
            cell.textLabel.text = @"Crash Now!";
            break;
            
        case 3:
            cell.textLabel.text = @"Reset notification";
            break;
            
        case 4:
            cell.textLabel.text = @"Logs Explorer";
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
			
		case 5:
			cell.textLabel.text = @"App Settings";
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			break;
			
		case 6:
			cell.textLabel.text = @"Switch Session";
			break;
            
		default:
			break;
	}
    
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	switch (indexPath.row) {
		case 0:
		{
//            [TestFlight openFeedbackView];
            [delegate didClickExit];
//            [self dismissViewControllerAnimated:YES completion:^{
                [[SBBark sharedBark] showBark];
//            }];
			break;
		}
			
        case 1:
        {
			DebugMenuDictionaryViewerController *controller = [[DebugMenuDictionaryViewerController alloc] init];
//            controller.object = [[NSMutableDictionary alloc] init];
			[self.navigationController pushViewController:controller animated:YES];
            break;
        }
            
        case 2:
            [self crashAndDie];
            break;
            
        case 3:
        {
            [[UIApplication sharedApplication] unregisterForRemoteNotifications];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"unregistered" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];
            break;
        }
            
        case 4:
        {
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Warning, this can be long, are you sure ?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Yes, see all sessions logs (very long)" otherButtonTitles:@"Yes, see my session log (long)", nil];
            [actionSheet showInView:self.view];
            break;
        }
            
		case 5:
		{
            [self.navigationController pushViewController:[[IASKAppSettingsViewController alloc] init] animated:YES];
			break;
		}
            
		case 6:
		{
            UITextField *tokenTextField;
            UIAlertView *alertView = [UIAlertView alertViewWithTitle:@"New token" message:nil dismissButtonTitle:@"" actionButtonTitle:@"Authenticate" action:^{
                [kCurrentSession logoutWithCompletion:^(BOOL success) {
                    kCurrentSession.token = tokenTextField.text;
                }];
            }];
            alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
            tokenTextField = [alertView textFieldAtIndex:0];
            [alertView show];
			break;
		}
            
		default:
			break;
	}
}

-(void) crashAndDie{
//
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

#pragma mark - Log Explorer

- (void)logExplorerOfSessionOnly:(BOOL)sessionOnly
{
    
    
    //NSMutableArray *logs = [NSMutableArray array];
    NSMutableDictionary *logs = [NSMutableDictionary dictionary];
    
    
    aslmsg q, m;
    int i;
    const char *key, *val;
    
    q = asl_new(ASL_TYPE_QUERY);
    asl_set_query(q, ASL_KEY_SENDER, "yerdle2", ASL_QUERY_OP_EQUAL);
    asl_set_query(q, ASL_KEY_LEVEL, "4", ASL_QUERY_OP_EQUAL);
    if(sessionOnly){
        int pid = [[NSProcessInfo processInfo] processIdentifier];
        NSString *pidString = [NSString stringWithFormat:@"%d", pid];
        char     *pidCString;
        pidCString = (char *) [pidString cStringUsingEncoding:[NSString defaultCStringEncoding]];
        asl_set_query(q, ASL_KEY_PID, pidCString, ASL_QUERY_OP_EQUAL);
    }
    
    NSArray *logsKeyToExport = [NSArray arrayWithObjects:@"Message", @"CFLog Local Time", nil];
    
    aslresponse r = asl_search(NULL, q);
    while (NULL != (m = aslresponse_next(r)))
    {
        NSMutableDictionary *log = [NSMutableDictionary dictionary];
        for (i = 0; (NULL != (key = asl_key(m, i))); i++)
        {
            NSString *keyString = [NSString stringWithUTF8String:(char *)key];
            if([logsKeyToExport indexOfObject:keyString] == NSNotFound) continue;
            val = asl_get(m, key);
            NSString *string = [NSString stringWithUTF8String:val];
            [log setObject:string forKey:keyString];
        }
        [logs setValue:[log valueForKey:@"Message"] forKey:[log valueForKey:@"CFLog Local Time"]];
    }
    aslresponse_free(r);
    
    DebugMenuDictionaryViewerController *controller = [[DebugMenuDictionaryViewerController alloc] init];
    controller.object = logs;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - UIActionSheetDelegate

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == actionSheet.destructiveButtonIndex)
        [self logExplorerOfSessionOnly:NO];
    else if(buttonIndex != actionSheet.cancelButtonIndex)
        [self logExplorerOfSessionOnly:YES];
    
}


@end

