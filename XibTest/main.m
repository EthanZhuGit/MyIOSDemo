//
//  main.m
//  XibTest
//
//  Created by hefu on 2022/7/2.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    NSLog(@"%@",appDelegateClassName);
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
 
