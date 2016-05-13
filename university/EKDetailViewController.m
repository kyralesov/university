//
//  EKDetailViewController.m
//  university
//
//  Created by Kyralesov on 05.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import "EKDetailViewController.h"
#import "EKStudentMO.h"
#import "EKDetailCell.h"
#import "EKCourseMO.h"
#import "UIView+EKUniversity.h"

@interface EKDetailViewController () <UITextFieldDelegate>

@property (strong , nonatomic) UITextField *dataPickerField;

@end

@implementation EKDetailViewController

@synthesize fetchedResultsController = _fetchedResultsController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.navigationItem.title = @"Details";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
     

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"EKCourse"
                                              inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entity];
    
    [request setFetchBatchSize:20];
    
    NSSortDescriptor *nameDescriotion = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [request setSortDescriptors:@[nameDescriotion]];
    
    EKStudentMO *student = (EKStudentMO *)self.detailObject;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"students contains %@",student];
    
    [request setPredicate:predicate];
    
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

#pragma mark - UITableView

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    
    
    if (editing) {
        [self.navigationItem setHidesBackButton:editing animated:animated];        
        [self.tableView setTextFieldEnabled:YES];
        [self.tableView firstTextFieldBecomeFirstResponder];
    } else {
        [self.tableView endEditing:YES];
        [self.tableView setTextFieldEnabled:NO];
        
        NSError *error;
        if(![self.managedObjectContext save:&error]) {
            NSLog(@"%@", [error localizedDescription]);
        }
        
        [self.delegate controllerDidChangeDetailObject:self];
        [self.navigationController popViewControllerAnimated:YES];
    }

    [super setEditing:editing animated:animated];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1 && indexPath.row == ([self.tableView numberOfRowsInSection:1] -1)) {

        
        //
        
        
    }
    
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1 && indexPath.row == ([self.tableView numberOfRowsInSection:1] -1)) {
        return YES;
    }
    
    return NO;

}

//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    return UITableViewCellEditingStyleNone;
//}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return section == 0 ? @"Student Details" : @"Courses";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 4;
    }
    
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section-1];
    
    return [sectionInfo numberOfObjects];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = nil;
    
    if (indexPath.section == 0) {
        
        static NSString *detailIdentifier = @"DetailCell";
        
        cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:detailIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailIdentifier];
        }
        
        EKDetailCell *detailCell = (EKDetailCell *)cell;
        EKStudentMO *student = (EKStudentMO *)self.detailObject;
        
        [detailCell.textField setEnabled:NO];
        
        switch (indexPath.row) {
            case 0:
                detailCell.detailLable.text = @"First Name";
                detailCell.textField.text = student.firstName;
                break;
            case 1:
                detailCell.detailLable.text = @"Last Name";
                detailCell.textField.text = student.lastName;
                break;
            case 2:
                detailCell.detailLable.text = @"Email";
                detailCell.textField.text = student.email;
                break;
            case 3:
                detailCell.detailLable.text = @"Birthday";
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"dd.MM.YYYY"];
                detailCell.textField.text = [formatter stringFromDate:student.dateOfBirth];
                
                UIDatePicker *datePicker = [[UIDatePicker alloc]init];
                datePicker.datePickerMode = UIDatePickerModeDate;
                datePicker.backgroundColor = [UIColor whiteColor];
                [datePicker setDate:student.dateOfBirth animated:YES];
                [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
                [detailCell.textField setInputView:datePicker];
                
                self.dataPickerField = detailCell.textField;
                
                
                break;
        }
        
    }
    else if (indexPath.section == 1) {
        
        static NSString *courseIdentifier = @"CourseCell";
        
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section-1];
        
        cell = [tableView dequeueReusableCellWithIdentifier:courseIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:courseIdentifier];
        }
        
        NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:newIndexPath];
        
        [self configureCell:cell withObject:object];
        

        NSInteger numberOfRows = [self.tableView numberOfRowsInSection:1];
        if (indexPath.row == numberOfRows-1 ) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"AddCourseCell"];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:courseIdentifier];
            }
        }
    }
    
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell withObject:(NSManagedObject *)object {
    

        EKCourseMO *course = (EKCourseMO *)object;
        cell.textLabel.text = course.name;
    
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    EKDetailCell *cell = (EKDetailCell* )[textField superCell];
    
    if ([self.detailObject isKindOfClass:[EKStudentMO class]]) {
        
        EKStudentMO *student = (EKStudentMO *)self.detailObject;
        
        if ([cell.detailLable.text isEqualToString:@"First Name"]) {
            student.firstName = textField.text;
        }
        if ([cell.detailLable.text isEqualToString:@"Last Name"]) {
            student.lastName = textField.text;
        }
        if ([cell.detailLable.text isEqualToString:@"Email"]) {
            student.email = textField.text;
        }
        if ([cell.detailLable.text isEqualToString:@"Birthday"]) {
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"dd.MM.YYYY"];
            student.dateOfBirth = [formatter dateFromString:textField.text];
        }
    }
    
    return YES;
}

#pragma mark - Actions

- (void)updateTextField:(UIDatePicker *)sender {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.YYYY"];
    self.dataPickerField.text = [formatter stringFromDate:sender.date];

}



#pragma mark - Requests

- (NSArray *)allCourses {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"EKCourse" inManagedObjectContext:self.managedObjectContext];
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [request setSortDescriptors:@[descriptor]];
    
    return [self.managedObjectContext executeFetchRequest:request error:nil];
}

@end
