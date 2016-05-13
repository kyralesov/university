//
//  EKCourseMO.m
//  university
//
//  Created by Kyralesov on 04.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import "EKCourseMO.h"
#import "EKStudentMO.h"
#import "EKTeacherMO.h"
#import "EKUniversityMO.h"

#import "EKDataManager.h"

@implementation EKCourseMO

+ (EKCourseMO *)courseWithName:(NSString *)name {
    
    NSManagedObjectContext *managedObjectContext = [[EKDataManager sharedManager] managedObjectContext];
    
    EKCourseMO *course = [NSEntityDescription insertNewObjectForEntityForName:@"EKCourse"
                                                       inManagedObjectContext:managedObjectContext];
    
    course.name = name;
    
    return course;
}

@end
