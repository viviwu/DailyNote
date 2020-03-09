//
//  AppDelegate.m
//  DailyNote
//
//  Created by viviwu on 2020/2/22.
//  Copyright © 2020 viviwu. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailViewController.h"
#import "MasterViewController.h"

@interface AppDelegate ()<UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
     if (@available(iOS 13.0, *)) {
         //UIWindowSceneDelegate
         
     } else {
         //fallback statements
         UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
         UINavigationController *navigationController = splitViewController.viewControllers.lastObject;
         navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
         navigationController.topViewController.navigationItem.leftItemsSupplementBackButton = YES;
         splitViewController.delegate = self;

         UINavigationController *masterNavigationController = splitViewController.viewControllers[0];
         MasterViewController *controller = (MasterViewController *)masterNavigationController.topViewController;
         controller.managedObjectContext = ((AppDelegate *)UIApplication.sharedApplication.delegate).persistentContainer.viewContext;
     }
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options{
  NSString *scheme = [[url scheme] lowercaseString];
  if([[url scheme] isEqualToString:@"share.inotes"]){
    NSLog(@"scheme: %@", scheme);
  }
  NSLog(@"openURL: %@ \n options:%@", url, options);
  return YES;
}
- (void)applicationDidBecomeActive:(UIApplication *)application{
    
}

- (void)applicationWillResignActive:(UIApplication *)application{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    [self saveContext];
}

- (void)applicationWillTerminate:(UIApplication *)application{
    
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"DailyNote"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSLog(@"%s", __func__);
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
