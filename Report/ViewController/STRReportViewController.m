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
#import "STREditArticleViewController.h"

@interface STRReportViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *detailText;

@end

@implementation STRReportViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.report) {
        self.titleLabel.text = self.report.title;
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
    STRAppDelegate *ad = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = ad.managedObjectContext;
    
    Report *report = self.report;
    report.title = self.titleLabel.text;
    report.detail = self.detailText.text;
    
    NSError *error = nil;
    [context save:&error];
    
    if (error) {
        NSLog(@"Ooops...something went wrong");
    } else {
        self.titleLabel.text = @"";
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
