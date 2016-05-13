//
//  EKDetailViewController.h
//  university
//
//  Created by Kyralesov on 05.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import "EKCoreDataTableViewController.h"

@protocol EKDetailViewControllerDelegate;

@interface EKDetailViewController : EKCoreDataTableViewController


@property (weak, nonatomic) id<EKDetailViewControllerDelegate> delegate;

@property (strong, nonatomic) NSManagedObject *detailObject;



@end

@protocol EKDetailViewControllerDelegate <NSObject>

- (void) controllerDidChangeDetailObject:(EKDetailViewController *) controller;

@end