//
//  RightViewController.h
//  SaveJapan
//
//  Created by jari on 3/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ColorPickerController.h"

@interface RightViewController : UIViewController <UISplitViewControllerDelegate, ColorPickerDelegate>{
    UILabel *messageLabel;
    
    UIPopoverController *_popover;
    UIToolbar *_toolbar;
    
    ColorPickerController *_colorPicker;
    UIPopoverController *_colorPickerPopover;
    UIBarButtonItem *colorButton;
    
}
@property(nonatomic, assign)UILabel *messageLabel;

@property(nonatomic, assign)UIPopoverController *popover;
@property(nonatomic, assign)UIToolbar *toolbar;

@property(nonatomic, retain) ColorPickerController *colorPicker;
@property(nonatomic, retain)UIPopoverController *colorPickerPopover;

- (void)setColorButtonTapped;
@end
