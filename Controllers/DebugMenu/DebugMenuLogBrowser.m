//
//  DebugMenuLogBrowser.m
//  Tunerfish
//
//  Created by Josh Kennedy on 9/14/11.
//  Copyright 2011 Plaxo. All rights reserved.
//

#import "DebugMenuLogBrowser.h"
#import "asl.h"
#include <stdio.h>

#define MAX_RESULTS 50

@implementation DebugMenuLogBrowser

@synthesize logMessages = _logMessages;

#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	

}


NSString *readLineAsNSString(FILE *file)
{
    char buffer[4096];

    NSMutableString *result = [NSMutableString stringWithCapacity:256];
	
    int charsRead;
    do{
		int numberOfVariablesSet = fscanf( file, "%4095[^\n]%n%*c", buffer, &charsRead );
        if( numberOfVariablesSet == 1 ){
            [result appendFormat:@"%s", buffer];
        }else{
            return nil;
		}
    } while( charsRead == 4095 );
	
    return result;
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	self.logMessages = [NSMutableArray array];
	
	
#ifdef _LCLLogFile_LogFilePath
	NSString *path = _LCLLogFile_LogFilePath;
#else
	NSString *path = @"";
#endif
    
	
	
	
	// Attach Log File (nothing to send if we can't open this file)
	if( [[NSFileManager defaultManager] fileExistsAtPath:path] )
	{
		FILE *file = fopen( [path UTF8String], "r" );

		fseek( file, -500*255, SEEK_END );
		
		while( !feof( file ) ){
			NSString *line = readLineAsNSString( file );
			if( line != nil ){
				[self.logMessages insertObject:line atIndex:0];
			}else{
				break;
			}
		}
		fclose( file );
	}
	
	[self.tableView reloadData];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_logMessages count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		cell.textLabel.font = [UIFont systemFontOfSize:10.0];
		cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
		cell.textLabel.numberOfLines = 0;
    }
    
    cell.textLabel.text = [_logMessages objectAtIndex:indexPath.row];
    
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	NSString* message = [_logMessages objectAtIndex:indexPath.row];
	CGSize size = [message sizeWithFont:[UIFont systemFontOfSize: 10.0] constrainedToSize:CGSizeMake(320.0, MAXFLOAT) lineBreakMode: UILineBreakModeWordWrap];
	return size.height + 20;
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

@end

