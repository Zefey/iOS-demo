//
//  AppDelegate.m
//  Test
//
//  Created by 刘泽锋 on 2022/5/13.
//

#import "AppDelegate.h"
#import "SDNormalViewController.h"
#import "SDTableViewController.h"
#import "SDWebViewController.h"
#import "SDCollectionViewController.h"
#import "SDSplashView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *tabController = [[UITabBarController alloc] init];
    
    
    SDNormalViewController *vc1 = [[SDNormalViewController alloc] init];
    SDTableViewController *vc2 = [[SDTableViewController alloc] init];
    SDWebViewController *vc3 = [[SDWebViewController alloc] init];
    SDCollectionViewController *vc4 = [[SDCollectionViewController alloc] init];
    
    
    [tabController setViewControllers:@[vc1,vc2,vc3,vc4]];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tabController];

    
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    
    [self.window addSubview:({
        SDSplashView *splash = [[SDSplashView alloc] initWithFrame:self.window.bounds];
        splash;
    })];
    
    
    return YES;
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Test"];
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
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

#pragma mark scheme
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    return YES;
}

@end
