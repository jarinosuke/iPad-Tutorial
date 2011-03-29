//
//  LeftViewController.h
//  SaveJapan
//
//  Created by jari on 3/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RightViewController.h"

@interface LeftViewController : UITableViewController {
    NSArray *lyrics_;
    RightViewController *rightViewController;    
}

@property(nonatomic, retain) RightViewController *rightViewController;

@end
