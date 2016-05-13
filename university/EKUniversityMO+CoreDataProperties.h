//
//  EKUniversityMO+CoreDataProperties.h
//  university
//
//  Created by Kyralesov on 04.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "EKUniversityMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface EKUniversityMO (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<EKStudentMO *> *students;
@property (nullable, nonatomic, retain) NSSet<EKTeacherMO *> *teachers;
@property (nullable, nonatomic, retain) NSSet<EKCourseMO *> *courses;

@end

@interface EKUniversityMO (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(EKStudentMO *)value;
- (void)removeStudentsObject:(EKStudentMO *)value;
- (void)addStudents:(NSSet<EKStudentMO *> *)values;
- (void)removeStudents:(NSSet<EKStudentMO *> *)values;

- (void)addTeachersObject:(EKTeacherMO *)value;
- (void)removeTeachersObject:(EKTeacherMO *)value;
- (void)addTeachers:(NSSet<EKTeacherMO *> *)values;
- (void)removeTeachers:(NSSet<EKTeacherMO *> *)values;

- (void)addCoursesObject:(EKCourseMO *)value;
- (void)removeCoursesObject:(EKCourseMO *)value;
- (void)addCourses:(NSSet<EKCourseMO *> *)values;
- (void)removeCourses:(NSSet<EKCourseMO *> *)values;

@end

NS_ASSUME_NONNULL_END
