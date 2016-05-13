//
//  EKCourseMO+CoreDataProperties.h
//  university
//
//  Created by Kyralesov on 04.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "EKCourseMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface EKCourseMO (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<EKStudentMO *> *students;
@property (nullable, nonatomic, retain) EKTeacherMO *teacher;
@property (nullable, nonatomic, retain) NSSet<EKUniversityMO *> *universities;

@end

@interface EKCourseMO (CoreDataGeneratedAccessors)

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
