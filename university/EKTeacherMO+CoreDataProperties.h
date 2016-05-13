//
//  EKTeacherMO+CoreDataProperties.h
//  university
//
//  Created by Kyralesov on 04.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "EKTeacherMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface EKTeacherMO (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *rank;
@property (nullable, nonatomic, retain) NSSet<EKCourseMO *> *courses;
@property (nullable, nonatomic, retain) NSSet<EKStudentMO *> *students;
@property (nullable, nonatomic, retain) NSSet<EKUniversityMO *> *universities;

@end

@interface EKTeacherMO (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(EKCourseMO *)value;
- (void)removeCoursesObject:(EKCourseMO *)value;
- (void)addCourses:(NSSet<EKCourseMO *> *)values;
- (void)removeCourses:(NSSet<EKCourseMO *> *)values;

- (void)addStudentsObject:(EKStudentMO *)value;
- (void)removeStudentsObject:(EKStudentMO *)value;
- (void)addStudents:(NSSet<EKStudentMO *> *)values;
- (void)removeStudents:(NSSet<EKStudentMO *> *)values;

- (void)addUniversitiesObject:(EKUniversityMO *)value;
- (void)removeUniversitiesObject:(EKUniversityMO *)value;
- (void)addUniversities:(NSSet<EKUniversityMO *> *)values;
- (void)removeUniversities:(NSSet<EKUniversityMO *> *)values;

@end

NS_ASSUME_NONNULL_END
