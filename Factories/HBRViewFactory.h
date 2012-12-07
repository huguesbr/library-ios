//
//  DBTViewFactory.h
//  Prototype
//
//  Created by Hugues on 11/26/12.
//  Copyright (c) 2012 1debit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBRViewFactory : NSObject

- (id) initWithNib: (NSString*)aNibName;

- (UITableViewCell*)cellOfKind: (NSString*)theCellKind forTable: (UITableView*)aTableView;

- (UIView *)viewOfKind: (NSString*)theViewKind;

+ (HBRViewFactory *)defaultFactory;

@end
