//
//  XAppHelper.m
//  DailyNote
//
//  Created by vivi wu on 2020/3/9.
//  Copyright © 2020 viviwu. All rights reserved.
//

#import "XAppHelper.h"
#import <UIKit/UIKit.h>

@implementation XAppHelper

static XAppHelper * _helper = nil;
+ (instancetype)instance{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _helper = [[XAppHelper alloc]init];
  });
  return _helper;
}

+ (BOOL)runningOnIpad {
  return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad);
}

@end
