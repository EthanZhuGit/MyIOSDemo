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

//@synthesize age = _age;

- (instancetype)init{
    self = [super init];
    if (self) {
        firstName=@"first name default";
        lastName=@"last name default";
        className=@"class name default";
        NSLog(@"Student init");
    }
    return self;
}

- (void)setFirstName:(NSString *)firstNameParam{
    firstName=firstNameParam;
}

- (NSString *)getFirstName{
    return firstName;
}

-(NSString *)getFullName{
    NSString *info = [self calculateAge:1995 currentYear:2022 name:[self info]];
    NSLog(@"info %@",info);
    return [[NSString alloc] initWithFormat:@"%@ %@",firstName,lastName];
//    return [firstName stringByAppendingString:lastName];
}

-(NSString*) info{
    return [[NSString alloc] initWithFormat:@"%@ %@ %@",firstName,lastName,className];
}

-(NSString*) calculateAge:(int)birthYear currentYear:(int)current name:(NSString*)nameParam {
    int age = current - birthYear;
    NSString *result = [[NSString alloc] initWithFormat:@"姓名:%@ 年龄:%d",nameParam,age];
    return result;
}



@end
