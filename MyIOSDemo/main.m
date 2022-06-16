//
//  main.m
//  MyIOSDemo
//
//  Created by hefu on 2022/6/3.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Student.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        NSLog(@"hello word123");
        
        Student *stu1 = [[Student alloc] init];
        
        NSLog(@"student stu1 name: %@ ",stu1.getFirstName);
        NSLog(@"stu1 first name: %@ ",stu1->lastName);
        NSLog(@"stu1 class name: %@ ",stu1.className);
        NSLog(@"stu1 full name: %@ ",stu1.getFullName);
        NSLog(@"stu1 age: %d ",stu1.age);
        stu1.age=20;
        [stu1 setAge:30];
        NSLog(@"stu1 %d ",[stu1 age]);
        
//        NSLog(@"stu1 full name: %@ ",[stu1 info]);
        
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
