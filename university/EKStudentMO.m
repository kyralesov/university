//
//  EKStudentMO.m
//  university
//
//  Created by Kyralesov on 04.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import "EKUniversityMO.h"
#import "EKStudentMO.h"
#import "EKCourseMO.h"
#import "EKTeacherMO.h"

#import "EKDataManager.h"

@implementation EKStudentMO

+ (EKStudentMO *)randomStudent {
    
    NSManagedObjectContext *managedObjectContext = [[EKDataManager sharedManager] managedObjectContext];
    
    EKStudentMO *student = [NSEntityDescription insertNewObjectForEntityForName:@"EKStudent"
                                                         inManagedObjectContext:managedObjectContext];
    
    student.firstName = firstNames[arc4random_uniform(100)];
    student.lastName = lastNames[arc4random_uniform(50)];
    student.email = [NSString stringWithFormat:@"%@.%@@gmail.com",student.firstName, student.lastName];
    
    NSTimeInterval time = 60*60*24*30*12 * arc4random_uniform(20);
    student.dateOfBirth = [NSDate dateWithTimeIntervalSinceReferenceDate:-time];
    
    student.score = @(((float)arc4random_uniform(200) / 100.f) + 2);
    
    
    return student;
}



@end
