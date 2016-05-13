//
//  EKCourseMO.h
//  university
//
//  Created by Kyralesov on 04.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class EKUniversityMO, EKStudentMO, EKTeacherMO;

NS_ASSUME_NONNULL_BEGIN

@interface EKCourseMO : NSManagedObject

+ (EKCourseMO *)courseWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

#import "EKCourseMO+CoreDataProperties.h"
