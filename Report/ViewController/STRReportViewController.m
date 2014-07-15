//
//  STRReportViewController.m
//  Report
//
//  Created by Lyndon Michael Bibera on 7/10/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

#import "STRAppDelegate.h"
#import "STRReportViewController.h"
#import "Report.h"
#import "STRDataManager.h"
#import "STREditArticleViewController.h"

@interface STRReportViewController ()
@property (weak, nonatomic) IBOutlet UITextView *detailText;

@end

@implementation STRReportViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.report) {
        self.title = self.report.title;
        self.detailText.text = self.report.detail;
    }
}

- (IBAction)tapToEditArticle:(id)sender
{
    [self performSegueWithIdentifier:@"ReportToArticleSegue" sender:self];
}

- (IBAction)tapToEditImages:(id)sender
{
    [self performSegueWithIdentifier:@"ReportToImagesSegue" sender:self];
}

- (IBAction)save:(UIBarButtonItem *)sender
{
    NSManagedObjectContext *context = [[STRDataManager sharedInstance] managedObjectContext];
    
    Report *report = self.report;
    report.detail = self.detailText.text;
    
    NSError *error = nil;
    [context save:&error];
    
    if (error) {
        NSLog(@"Ooops...something went wrong");
    } else {
        self.detailText.text = @"";
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"ReportToArticleSegue"] && [segue.destinationViewController isKindOfClass:[STREditArticleViewController class]]) {
        NSLog(@"ReportToArticleSegue");
        STREditArticleViewController *dvc = segue.destinationViewController;
        dvc.report = self.report;
    }
}

@end
