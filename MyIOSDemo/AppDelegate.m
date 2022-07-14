//
//  AppDelegate.m
//  MyIOSDemo
//
//  Created by hefu on 2022/6/3.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    Person *person = [[Person alloc] init];
    NSLog(@"person lastName=%@ ",person->lastName);
    person->lastName = @"Hunt";
    NSLog(@"person %d %@",person.age,person->lastName);

    Student *stu1 = [[Student alloc] init];

    NSLog(@"student stu1 name: %@ ",stu1.getFirstName);
    NSLog(@"stu1 first name: %@ ",stu1->lastName);
    NSLog(@"stu1 class name: %@ ",stu1.className);
    NSLog(@"stu1 full name: %@ ",stu1.getFullName);
    NSLog(@"stu1 age: %d ",stu1.age);
    stu1.age=20;
    [stu1 setAge:30];
    NSLog(@"stu1 %d ",[stu1 age]);

    return YES;
}


- (void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"");
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
    NSLog(@"");
}

- (void)applicationWillResignActive:(UIApplication *)application{
    NSLog(@"");
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"");
}

- (void)applicationWillTerminate:(UIApplication *)application{
    NSLog(@"");
}





#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    NSLog(@"application configurationForConnectingSceneSession");
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    NSLog(@"application didDiscardSceneSessions");
}


@end
