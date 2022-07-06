//
// Created by hefu on 2022/7/6.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
    NSString *firstName;
@public
    NSString *lastName;

    int age;
}
@property int age;

@property NSString *gender;

- (NSString *)getFirstName;

- (NSString *)getFullName;

- (void)setFirstName:(NSString *)firstNameParam;

@end