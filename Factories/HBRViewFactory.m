//
//  DBTViewFactory.m
//  Prototype
//
//  Created by Hugues on 11/26/12.
//  Copyright (c) 2012 1debit. All rights reserved.
//

#import "HBRViewFactory.h"

#ifndef kHBRViewFactoryNibName
#define kHBRViewFactoryNibName @"Views"
#endif

@interface HBRViewFactory()
@property (strong) NSMutableDictionary * viewTemplateStore;
@property (strong) UINib * nibStore;
@property (strong) NSArray * templates;
@end

@implementation HBRViewFactory

- (id) initWithNib: (NSString*)aNibName;
{
    if (self == [super init]) {
        self.viewTemplateStore = [[NSMutableDictionary alloc] init];
//        self.nibStore = [UINib nibWithNibName:aNibName bundle:nil];
//        [self.nibStore instantiateWithOwner:self options:nil];
        NSArray * templates = [[NSBundle mainBundle] loadNibNamed:aNibName owner:self options:nil];
        for (UIView *viewTemplate in templates) {
            NSString * key = viewTemplate.restorationIdentifier;
            if (key) {
                [self.viewTemplateStore setObject:[NSKeyedArchiver
                                              archivedDataWithRootObject:viewTemplate]
                                      forKey:key];
            } else {
                @throw [NSException exceptionWithName:@"Unknown cell"
                                               reason:@"Cell has no reuseIdentifier"
                                             userInfo:nil];
            }
        }
    }
    
    return self;
}

- (UITableViewCell *)cellOfKind: (NSString*)theCellKind forTable: (UITableView*)aTableView;
{
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:theCellKind];
    
    if (!cell) {
        NSData * cellData = [self.viewTemplateStore objectForKey:theCellKind];
        if (cellData) {
            cell = [NSKeyedUnarchiver unarchiveObjectWithData:cellData];
        } else {
            NSLog(@"Don't know nothing about cell of kind %@", theCellKind);
        }
    }
    
    return cell;
}

- (UIView *)viewOfKind: (NSString*)theViewKind;
{
    UIView *view;
    
    NSData * viewData = [self.viewTemplateStore objectForKey:theViewKind];
    if (viewData) {
        view = [NSKeyedUnarchiver unarchiveObjectWithData:viewData];
    } else {
        NSLog(@"Don't know nothing about cell of kind %@", theViewKind);
    }
    
    return view;
}

+ (HBRViewFactory *)defaultFactory;
{
    static HBRViewFactory *_defaultFactory;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultFactory = [[HBRViewFactory alloc] initWithNib:kHBRViewFactoryNibName];
    });
    return _defaultFactory;
}

@end
