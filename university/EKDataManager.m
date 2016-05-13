//
//  EKDataManager.m
//  university
//
//  Created by Yura on 02.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import "EKDataManager.h"

#import "EKUniversityMO.h"
#import "EKCourseMO.h"
#import "EKTeacherMO.h"
#import "EKStudentMO.h"

@implementation EKDataManager

+ (EKDataManager *)sharedManager {
    
    static EKDataManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[EKDataManager alloc] init];
    });
    
    return manager;
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "kyralesov.com.university" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"university" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"university.sqlite"];
    NSError *error = nil;
    //NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
        
        if(![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
                NSLog(@"%@", [error localizedDescription]);
        }
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Fill Database

- (void)fillDatabase {
    
    EKUniversityMO *university = [EKUniversityMO universityWithName:@"Stanford University"];
    
    NSArray *courses = @[[EKCourseMO courseWithName:@"Objective-C"],
                                       [EKCourseMO courseWithName:@"Swift"],
                                       [EKCourseMO courseWithName:@"HTML5"],
                                       [EKCourseMO courseWithName:@"JavaScript"],
                                       [EKCourseMO courseWithName:@"C++"]];
    
    
    NSMutableArray *teachers = [NSMutableArray array];
    for (int i=0; i<5; i++) {
        [teachers addObject:[EKTeacherMO randomTeacher]];
    }
    
    NSMutableArray *students = [NSMutableArray array];
    for (int i=0; i<100; i++) {
        [students addObject:[EKStudentMO randomStudent]];
    }
    
    
    // university
    
    [university addCourses:[NSSet setWithArray:courses]];
    [university addTeachers:[NSSet setWithArray:teachers]];
    [university addStudents:[NSSet setWithArray:students]];
    
    // course
    
    for (int i=0; i < [courses count]; i++) {
        EKCourseMO *course = [courses objectAtIndex:i];
        EKTeacherMO *teacher = [teachers objectAtIndex:i];
        
        course.teacher = teacher;
        
        NSArray *studentsForCourse = [self randomElements:arc4random_uniform(20)+20 FromArray:students];
        [course addStudents:[NSSet setWithArray:studentsForCourse]];
    }
    

    
    NSError *error = nil;
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    
    
}

#pragma mark - Private Methods

- (NSArray *)randomElements:(int)count FromArray:(NSMutableArray *)array {
    
    NSMutableArray *sourceArray = [array mutableCopy];
    NSMutableArray *tmpArray = [NSMutableArray array];
    
    for (int i=0; i<count; i++) {
        int index = arc4random_uniform((int)[sourceArray count]);
        [tmpArray addObject:[sourceArray objectAtIndex:index]];
        [sourceArray removeObjectAtIndex:index];
    }
    
    return [NSArray arrayWithArray:tmpArray];
    
}

@end
