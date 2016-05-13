//
//  EKUniversityMO.m
//  university
//
//  Created by Kyralesov on 04.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import "EKUniversityMO.h"
#import "EKCourseMO.h"
#import "EKStudentMO.h"
#import "EKTeacherMO.h"

#import "EKDataManager.h"

@implementation EKUniversityMO

+ (EKUniversityMO *)universityWithName:(NSString *)name {
    
    NSManagedObjectContext *managedObjectContext = [[EKDataManager sharedManager] managedObjectContext];
    
    EKUniversityMO *university = [NSEntityDescription insertNewObjectForEntityForName:@"EKUniversity"
                                                       inManagedObjectContext:managedObjectContext];
    
    university.name = name;
    
    return university;
    
}

@end
