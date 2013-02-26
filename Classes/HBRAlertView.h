//
//  HBRAlertView.h
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/21/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HBRAlertViewDelegate <UIAlertViewDelegate>

@end

@interface HBRAlertView : UIAlertView <HBRAlertViewDelegate>

@end
