//
//  Student.h
//  MyIOSDemo
//
//  Created by hefu on 2022/6/5.
//

#ifndef Student_h
#define Student_h


#endif /* Student_h */

@interface Student : NSObject {
    NSString *firstName;
    @public NSString *lastName;
    NSString *className;
}

@property NSString *className;

@property int age;

-(void) setFirstName:(NSString*) firstNameParam;

-(NSString*) getFirstName;

-(NSString*) getFullName;

@end
