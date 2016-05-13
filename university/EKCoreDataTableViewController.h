//
//  EKCoreDataTableViewController.h
//  university
//
//  Created by Yura on 03.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EKDataManager.h"

@interface EKCoreDataTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)configureCell:(UITableViewCell *)cell withObject:(NSManagedObject *)object;

@end
