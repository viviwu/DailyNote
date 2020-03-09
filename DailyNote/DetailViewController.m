//
//  DetailViewController.m
//  DailyNote
//
//  Created by viviwu on 2020/2/22.
//  Copyright © 2020 viviwu. All rights reserved.
//

#import "DetailViewController.h"
#import "UITextInput+DoneButton.h"

@interface DetailViewController ()<UITextViewDelegate, UITextFieldDelegate>

@end

@implementation DetailViewController

- (IBAction)saveDraft:(id)sender {
    
}

- (IBAction)stopEdit:(id)sender {
    
}

#pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView{
    [self setEditing:YES animated:YES];
}

- (void)textViewDidChange:(UITextView *)textView{
    self.detailItem.brief = textView.text;
}

//- (void)textViewDidEndEditing:(UITextView *)textView{
//    self.detailItem.brief = textView.text;
//}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
     [self setEditing:YES animated:YES];
    textField.selected = YES;
    textField.textColor = UIColor.orangeColor;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    textField.textColor = UIColor.blueColor;
    self.detailItem.title = textField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    textField.layer.borderColor = UIColor.clearColor.CGColor;
    textField.layer.borderWidth = 0;
    [textField endEditing:YES];
    return YES;
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = self.detailItem.timestamp.description;
        self.briefTextView.text = self.detailItem.brief;
        self.titleTextField.text = self.detailItem.title;
        if (!(self.detailItem.title.length>0)) {
            self.titleTextField.textColor = UIColor.lightGrayColor;
            self.titleTextField.text = @"untitled!";
        }
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.titleTextField.backgroundColor = [UIColor.yellowColor colorWithAlphaComponent:0.1];
    [self.titleTextField addDoneButton];
  
    self.titleTextField.textColor = UIColor.darkTextColor;
    self.titleTextField.delegate = self;
    self.briefTextView.delegate = self;
  [self.briefTextView addDoneButton];
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setEditing:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.detailItem.update = NSDate.date;
    [NSNotificationCenter.defaultCenter postNotificationName:kUpdateObjectNotification object:self.detailItem];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    if (editing) {
        if (self.detailItem.title.length<1 || self.titleTextField.isFirstResponder) {
            [self.titleTextField becomeFirstResponder];
        }else{
            [self.briefTextView becomeFirstResponder];
        }
    }else{
        [self.titleTextField endEditing:YES];
        [self.briefTextView endEditing:YES];
    }
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(XWEvent *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


@end
