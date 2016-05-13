//
//  EKUniversityMO.h
//  university
//
//  Created by Kyralesov on 04.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class EKCourseMO, EKStudentMO, EKTeacherMO;

NS_ASSUME_NONNULL_BEGIN

@interface EKUniversityMO : NSManagedObject

+ (EKUniversityMO *)universityWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

#import "EKUniversityMO+CoreDataProperties.h"
