//
//  STRReportTableViewController.m
//  Report
//
//  Created by Lyndon Michael Bibera on 7/12/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

#import "Report.h"
#import "STRReportTableViewCell.h"
#import "STRReportTableViewController.h"
#import "STRReportViewController.h"
#import "STRDataManager.h"
#import "constants.h"

@interface STRReportTableViewController ()

- (IBAction)addReport:(UIBarButtonItem *)sender;

@end

@implementation STRReportTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.context =  [[STRDataManager sharedInstance] managedObjectContext];
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
    
    NSFetchRequest *request = [NSFetchRequest new];
    [request setEntity:[NSEntityDescription entityForName:EntityReport inManagedObjectContext:self.context]];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"dateCreated" ascending:NO];
    request.sortDescriptors = @[sortDescriptor];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.context sectionNameKeyPath:@"title" cacheName:@"Master"];
    
    NSError *error = nil;
    if (![fetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    } else {
        self.fetchedResultsController = fetchedResultsController;
    }
    
    return _fetchedResultsController;
}

#pragma mark - Navigation

- (IBAction)addReport:(UIBarButtonItem *)sender
{
    Report *newReport = [NSEntityDescription insertNewObjectForEntityForName:EntityReport inManagedObjectContext:self.context];
    newReport.title = @"My Article";
    newReport.detail = @"Some Details...";
    
    self.selectedReport = newReport;
    [self performSegueWithIdentifier:SegueEditReport sender:self];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Report *report = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    self.selectedReport = report;
    [self performSegueWithIdentifier:SegueEditReport sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:SegueEditReport] && [segue.destinationViewController isKindOfClass:[STRReportViewController class]]) {
        NSLog(@"EditReport");
        STRReportViewController *dvc = segue.destinationViewController;
        dvc.report = self.selectedReport;
    }
}

- (IBAction)unwindToReportTableVC:(UIStoryboardSegue *)segue
{
    NSString *segueId = segue.identifier;
    NSLog(@"Segue:%@", segueId);
    
    if ([segueId isEqualToString:UnwindSegueToReportTableVC]) {
        //TODO: do something
    }
}

@end
