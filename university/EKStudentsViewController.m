//
//  EKStudentsViewController.m
//  university
//
//  Created by Yura on 05.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import "EKStudentsViewController.h"
#import "EKStudentMO.h"
#include "EKStudentCell.h"
#include "EKDetailViewController.h"

@interface EKStudentsViewController () <EKDetailViewControllerDelegate>

@end

@implementation EKStudentsViewController

@synthesize fetchedResultsController = _fetchedResultsController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action

- (IBAction)actionAddStudent:(UIBarButtonItem *)sender {
    
    EKDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EKDetailViewController"];
    vc.delegate = self;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        EKDetailViewController *vc = (EKDetailViewController *)[segue destinationViewController];
        vc.delegate = self;
        vc.detailObject = object;
        
    }
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"EKStudent"
                                              inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entity];
    
    [request setFetchBatchSize:20];
    
    NSSortDescriptor *firstNameDescriotion = [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES];
    NSSortDescriptor *lastNameDescriotion = [NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending:YES];
    [request setSortDescriptors:@[firstNameDescriotion, lastNameDescriotion]];
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                                                managedObjectContext:self.managedObjectContext
                                                                                                  sectionNameKeyPath:nil
                                                                                                           cacheName:nil];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    
    
    return _fetchedResultsController;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"StudentCell";
    
    EKStudentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[EKStudentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];

    [self configureCell:cell withObject:object];

    
    return cell;
}


- (void)configureCell:(UITableViewCell *)cell withObject:(NSManagedObject *)object {
    
    EKStudentCell *studentCell = (EKStudentCell *)cell;
    EKStudentMO *student = (EKStudentMO *)object;
    
    studentCell.nameLable.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.YYYY"];
    studentCell.detailLable.text = [formatter stringFromDate:student.dateOfBirth];
    
    studentCell.coursesLable.text = [NSString stringWithFormat:@"Courses: %lu", [student.courses count]];
    
}

#pragma mark -  EKDetailViewControllerDelegate

- (void) controllerDidChangeDetailObject:(EKDetailViewController *) controller {
    [self.tableView reloadData];
}

@end
