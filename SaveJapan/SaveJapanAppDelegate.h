//
//  SaveJapanAppDelegate.h
//  SaveJapan
//
//  Created by jari on 3/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LeftViewController.h"
#import "RightViewController.h"
@interface SaveJapanAppDelegate : NSObject <UIApplicationDelegate>{

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) LeftViewController *leftViewController;
@property (nonatomic, retain) RightViewController *rightViewController;
@property (nonatomic, retain) UISplitViewController *splitViewController;


@end
