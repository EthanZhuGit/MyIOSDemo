//
// Created by hefu on 2022/7/6.
//

#import "Person.h"


@implementation Person

@synthesize age = _age;

- (instancetype)init {
    self = [super init];
    if (self) {
        firstName = @"first name default";
        lastName = @"last name default";
        NSLog(@"Person init");
    }
    return self;
}


- (void)setFirstName:(NSString *)firstNameParam {
    firstName = firstNameParam;
}

- (NSString *)getFirstName {
    return firstName;
}

- (NSString *)getFullName {
    NSString *info = [self calculateBirtYear:2022 name:[self info]];
    NSLog(@"info %@", info);
    return [[NSString alloc] initWithFormat:@"%@ %@", firstName, lastName];
}


- (NSString *)calculateBirtYear:(int)current name:(NSString *)nameParam {
    int birthYear = current - age;
    NSString *result = [[NSString alloc] initWithFormat:@"姓名:%@ 出生:%d", nameParam, birthYear];
    return result;
}

- (NSString *)info {
    return [[NSString alloc] initWithFormat:@"%@ %@ %@ %d", firstName, lastName,_gender,age];
}

@end