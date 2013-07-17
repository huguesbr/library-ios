//
//  DebugMenuDictionaryViewerController.m
//  BirthdayGram
//
//  Created by Hugues BERNET-ROLLANDE on 3/14/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

#import "DebugMenuDictionaryViewerController.h"

@implementation DebugMenuDictionaryViewerController
@synthesize object = _object;
@synthesize values = _values;
@synthesize keys = _keys;
@synthesize dictionary = _dictionary;
@synthesize detailTextView = _detailTextView;
@synthesize hideDetailButton = _hideDetailButton;


- (void)setObject:(id)object
{
    if([object isKindOfClass:[NSArray class]])
        self.values = object;
    else if([object isKindOfClass:[NSDictionary class]]){
        self.values = [object allValues];
        self.keys = [object allKeys];
    }
}

- (id)object
{
    return nil;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidUnload
{
    [_detailTextView removeFromSuperview];
    [_hideDetailButton removeFromSuperview];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.values.count;
}

- (NSString *)keyAtIndexPath:(NSIndexPath *)indexPath
{
//    return [[self.dictionary allKeys] objectAtIndex:indexPath.row];
    NSString *key = nil;
    if(self.keys) key = [self.keys objectAtIndex:indexPath.row];
    return key;
}

- (NSString *)objectAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.values objectAtIndex:indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSString *key = [self keyAtIndexPath:indexPath];
    cell.textLabel.text = key;
    cell.accessoryType = UITableViewCellAccessoryNone;
    id value = [self objectAtIndexPath:indexPath];
    if ([value isKindOfClass:[NSNumber class]]){
        cell.detailTextLabel.text = [value stringValue];
    }
    else if ([value isKindOfClass:[NSString class]]){
        cell.detailTextLabel.text = (NSString *)value;
    } else if([value isKindOfClass:[NSDictionary class]]){
        cell.detailTextLabel.text = @"click to explore";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else{
        cell.detailTextLabel.text = @"unknow datatype";
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id value = [self objectAtIndexPath:indexPath];
    if([value isKindOfClass:[NSDictionary class]] || [value isKindOfClass:[NSArray class]]){
        DebugMenuDictionaryViewerController *controller = [[DebugMenuDictionaryViewerController alloc] init];
        controller.object = value;
        [self.navigationController pushViewController:controller animated:YES];
    } else if([value isKindOfClass:[NSString class]]){
        if(!_detailTextView) {
            CGRect frame = [UIScreen mainScreen].bounds;
            frame.origin.y = 20;
            frame.size.height -= 20;
            _detailTextView = [[UITextView alloc] initWithFrame:frame];
            _detailTextView.editable = NO;
//            NSMutableArray *gesturesToKeep = [NSMutableArray array];
//            for (id gesture in _textView.gestureRecognizers) {
//                if([gesture isKindOfClass:[UIPanGestureRecognizer class]])
//                    [gesturesToKeep addObject:gesture];
//            }
//            _textView.gestureRecognizers = gesturesToKeep;
//            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideDetail)];
//            tapGesture.numberOfTapsRequired = 2;
//            [_textView addGestureRecognizer:tapGesture]; 
//            [tapGesture release];
            [self.view.window addSubview:_detailTextView];
            
            _hideDetailButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            _hideDetailButton.frame = CGRectMake(0, frame.size.height - 50, frame.size.width, 50);
            [_hideDetailButton setTitle:@"close" forState:UIControlStateNormal];
            [_hideDetailButton addTarget:self action:@selector(hideDetail) forControlEvents:UIControlEventTouchUpInside];
            [self.view.window addSubview:_hideDetailButton];
        }
        self.hideDetailButton.hidden = NO;
        self.detailTextView.hidden = NO;
        self.detailTextView.text = value;
    }
    return;
}

- (void)hideDetail
{
    self.detailTextView.hidden = YES;
    self.hideDetailButton.hidden = YES;
}
    

@end
