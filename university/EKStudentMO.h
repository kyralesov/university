//
//  EKStudentMO.h
//  university
//
//  Created by Kyralesov on 04.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKUserMO.h"

@class EKUniversityMO, EKCourseMO, EKTeacherMO;

NS_ASSUME_NONNULL_BEGIN

@interface EKStudentMO : EKUserMO

+ (EKStudentMO *)randomStudent;

@end

NS_ASSUME_NONNULL_END

#import "EKStudentMO+CoreDataProperties.h"
