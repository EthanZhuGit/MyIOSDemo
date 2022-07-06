//
//  Student.m
//  MyIOSDemo
//
//  Created by hefu on 2022/6/5.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@implementation Student

@synthesize className = className;

- (instancetype)init{
    self = [super init];
    if (self) {
        className=@"class name default";
        NSLog(@"Student init");
    }
    return self;
}

- (NSString *)info {
    return [[NSString alloc] initWithFormat:@"%@ %@ %@ %@", firstName, lastName, className, _stuId];
}



@end
