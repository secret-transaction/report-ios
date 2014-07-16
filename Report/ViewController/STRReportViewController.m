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
#import "Report+Description.h"
#import "STRDataManager.h"
#import "STREditArticleViewController.h"

@interface STRReportViewController ()

@property (weak, nonatomic) IBOutlet UITextView *detailText;
@property (weak, nonatomic) IBOutlet UIImageView *reportPrimaryImage;

@property (weak, nonatomic) IBOutlet UITextView *reportDetails;
- (IBAction)save:(UIBarButtonItem *)sender;

@end

@implementation STRReportViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.context = [STRDataManager sharedInstance].managedObjectContext;
    [self configureView];
}

- (void)configureView
{
    Report *rep = self.report;
    if (rep) {
        self.title = rep.title;
        self.detailText.text = rep.detail;
        //TODO: configure image
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
    NSError *error = nil;
    [self.context save:&error];
    
    if (error) {
        NSLog(@"Ooops...something went wrong");
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Save Failed, Try Again?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [alertView show];
    }
}

#pragma mark - Alert View Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:
    (NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            NSLog(@"Cancel button clicked");
            break;
        case 1:
            NSLog(@"OK button clicked");
            break;
            
        default:
            break;
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

- (IBAction)unwindFromModalViewController:(UIStoryboardSegue *)segue
{
    if ([segue.sourceViewController isKindOfClass:[STREditArticleViewController class]]) {
        STREditArticleViewController *svc = segue.sourceViewController;
        NSLog(@"%@", [svc.report display]);
        [self configureView];
    }
}

@end
