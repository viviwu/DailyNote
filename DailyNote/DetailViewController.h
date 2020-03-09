//
//  DetailViewController.h
//  DailyNote
//
//  Created by viviwu on 2020/2/22.
//  Copyright © 2020 viviwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyNote+CoreDataModel.h"


#define kUpdateObjectNotification  @"UpdateManagedObjectNSNotification"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) XWEvent *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextView *briefTextView;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@end

