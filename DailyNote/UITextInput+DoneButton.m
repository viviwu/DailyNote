//
//  UITextView+DoneButton.m
//  DailyNote
//
//  Created by vivi wu on 2020/3/9.
//  Copyright © 2020 viviwu. All rights reserved.
//

#import "UITextInput+DoneButton.h"
#import "XAppHelper.h"
#import "constant.h"
//#import <AppKit/AppKit.h>
 

@implementation UITextField (DoneButton)

- (void)addDoneButton {
  // actually on iPad there is a done button
  if (!IPAD) {
    UIToolbar *numberToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 50)];
    numberToolbar.items = [NSArray
      arrayWithObjects:[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Cancel", nil)
                                style:UIBarButtonItemStylePlain
                               target:self
                               action:@selector(cancelNumberPad)],
               [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                       target:nil
                                       action:nil],
               [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Done", nil)
                                style:UIBarButtonItemStyleDone
                               target:self
                               action:@selector(doneWithNumberPad)],
               nil];
    [numberToolbar sizeToFit];

    self.inputAccessoryView = numberToolbar;
  }
}

- (void)cancelNumberPad {
  [self resignFirstResponder];
//  self.text = @"";
}

- (void)doneWithNumberPad {
  [self resignFirstResponder];
}
@end


@implementation UITextView (DoneButton)

- (void)addDoneButton {
  // actually on iPad there is a done button
  if (!IPAD) {
    UIToolbar *numberToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 50)];
    numberToolbar.items = [NSArray
      arrayWithObjects:[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Cancel", nil)
                                style:UIBarButtonItemStylePlain
                               target:self
                               action:@selector(cancelNumberPad)],
               [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                       target:nil
                                       action:nil],
               [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Done", nil)
                                style:UIBarButtonItemStyleDone
                               target:self
                               action:@selector(doneWithNumberPad)],
               nil];
    [numberToolbar sizeToFit];

    self.inputAccessoryView = numberToolbar;
  }
}

- (void)cancelNumberPad {
  [self resignFirstResponder];
//  self.text = @"";
}

- (void)doneWithNumberPad {
  [self resignFirstResponder];
}
@end

