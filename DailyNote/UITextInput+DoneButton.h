//
//  UITextView+DoneButton.h
//  DailyNote
//
//  Created by vivi wu on 2020/3/9.
//  Copyright © 2020 viviwu. All rights reserved.
//

//#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UITextField (DoneButton)
- (void)addDoneButton;
@end

@interface UITextView (DoneButton)
- (void)addDoneButton;
@end

NS_ASSUME_NONNULL_END
