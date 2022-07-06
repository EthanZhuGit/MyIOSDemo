//
//  main.m
//  MyIOSDemo
//
//  Created by hefu on 2022/6/3.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "syntax/Student.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
