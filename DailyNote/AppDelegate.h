//
//  AppDelegate.h
//  DailyNote
//
//  Created by viviwu on 2020/2/22.
//  Copyright © 2020 viviwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

