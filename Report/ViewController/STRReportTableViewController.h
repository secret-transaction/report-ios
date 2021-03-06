//
//  STRReportTableViewController.h
//  Report
//
//  Created by Lyndon Michael Bibera on 7/12/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

@interface STRReportTableViewController : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) Report *selectedReport;

@end
