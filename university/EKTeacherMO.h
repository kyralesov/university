//
//  EKTeacherMO.h
//  university
//
//  Created by Kyralesov on 04.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKUserMO.h"

@class EKUniversityMO, EKCourseMO, EKStudentMO;

NS_ASSUME_NONNULL_BEGIN

@interface EKTeacherMO : EKUserMO

+ (EKStudentMO *)randomTeacher;

@end

NS_ASSUME_NONNULL_END

#import "EKTeacherMO+CoreDataProperties.h"
