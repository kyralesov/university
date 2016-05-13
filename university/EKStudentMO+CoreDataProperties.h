//
//  EKStudentMO+CoreDataProperties.h
//  university
//
//  Created by Kyralesov on 04.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "EKStudentMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface EKStudentMO (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *score;
@property (nullable, nonatomic, retain) NSSet<EKCourseMO *> *courses;
@property (nullable, nonatomic, retain) NSSet<EKTeacherMO *> *teachers;
@property (nullable, nonatomic, retain) EKUniversityMO *university;

@end

@interface EKStudentMO (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(EKCourseMO *)value;
- (void)removeCoursesObject:(EKCourseMO *)value;
- (void)addCourses:(NSSet<EKCourseMO *> *)values;
- (void)removeCourses:(NSSet<EKCourseMO *> *)values;

- (void)addTeachersObject:(EKTeacherMO *)value;
- (void)removeTeachersObject:(EKTeacherMO *)value;
- (void)addTeachers:(NSSet<EKTeacherMO *> *)values;
- (void)removeTeachers:(NSSet<EKTeacherMO *> *)values;

@end

NS_ASSUME_NONNULL_END
