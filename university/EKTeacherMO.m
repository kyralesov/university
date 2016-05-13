//
//  EKTeacherMO.m
//  university
//
//  Created by Kyralesov on 04.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import "EKUniversityMO.h"
#import "EKTeacherMO.h"
#import "EKCourseMO.h"
#import "EKStudentMO.h"

#import "EKDataManager.h"

static NSString *teacherRank[] = {@"Professor", @"Associate Professor", @"Assistant Professor", @"Lecturer"};

@implementation EKTeacherMO

+ (EKTeacherMO *)randomTeacher {
    
    NSManagedObjectContext *managedObjectContext = [[EKDataManager sharedManager] managedObjectContext];
    
    EKTeacherMO *teacher = [NSEntityDescription insertNewObjectForEntityForName:@"EKTeacher"
                                                         inManagedObjectContext:managedObjectContext];
    
    teacher.firstName = firstNames[arc4random_uniform(100)];
    teacher.lastName = lastNames[arc4random_uniform(50)];
    teacher.email = [NSString stringWithFormat:@"%@@gmail.com",teacher.lastName];
    teacher.dateOfBirth = [NSDate dateWithTimeIntervalSinceReferenceDate: -( 60*60*24 * (arc4random_uniform(20)+10) )];
    teacher.rank = teacherRank[arc4random_uniform(4)];
    
    return teacher;
}

@end
