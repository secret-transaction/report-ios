//
//  STRReportTableViewController.m
//  Report
//
//  Created by Lyndon Michael Bibera on 7/12/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

#import "STRReportTableViewController.h"
#import "STRAppDelegate.h"
#import "STRReportTableViewCell.h"
#import "Report.h"
#import "STRReportViewController.h"

@interface STRReportTableViewController ()

@end

@implementation STRReportTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.context =  [(STRAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
}

- (IBAction)addReport:(UIBarButtonItem *)sender
{
    self.selectedReport = [NSEntityDescription insertNewObjectForEntityForName:@"Report" inManagedObjectContext:self.context];
    [self performSegueWithIdentifier:@"EditReportSegue" sender:self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STRReportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"defaultCell" forIndexPath:indexPath];
    
    Report *report = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.title.text = report.title;
    return cell;
}

#pragma mark - Fetched Results Controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    STRAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    
    
    NSFetchRequest *request = [NSFetchRequest new];
    [request setEntity:[NSEntityDescription entityForName:@"Report" inManagedObjectContext:context]];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"dateCreated" ascending:NO];
    request.sortDescriptors = @[sortDescriptor];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:@"title" cacheName:@"Master"];
    
    NSError *error = nil;
    if (![fetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    } else {
        self.fetchedResultsController = fetchedResultsController;
    }
    
    return _fetchedResultsController;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"EditReportSegue"] && [segue.destinationViewController isKindOfClass:[STRReportViewController class]]) {
        NSLog(@"EditReport");
        STRReportViewController *dvc = segue.destinationViewController;
        dvc.report = self.selectedReport;
    }
}

@end
