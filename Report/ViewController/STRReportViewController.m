//
//  STRReportViewController.m
//  Report
//
//  Created by Lyndon Michael Bibera on 7/10/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

#import "STRReportViewController.h"
#import "STREditArticleViewController.h"
#import "STREditImagesViewController.h"

@interface STRReportViewController ()

@property (weak, nonatomic) IBOutlet UITextView *detailText;
@property (weak, nonatomic) IBOutlet UIImageView *reportPrimaryImage;
@property (weak, nonatomic) IBOutlet UITextView *reportDetails;

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
    [self performSegueWithIdentifier:SegueEditArticle sender:self];
}

- (IBAction)tapToEditImages:(id)sender
{
    [self performSegueWithIdentifier:SegueEditImages sender:self];
}

- (void)save
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
    NSString *segueId = segue.identifier;
    NSLog(@"Segue:%@", segueId);
    
    if ([segueId isEqualToString:SegueEditArticle] && [segue.destinationViewController isKindOfClass:[STREditArticleViewController class]]) {
        STREditArticleViewController *dvc = segue.destinationViewController;
        dvc.report = self.report;
    } else if ([segueId isEqualToString:SegueEditImages]) {
        STREditImagesViewController *dvc = segue.destinationViewController;
        dvc.report = self.report;
    } else if ([segueId isEqualToString:UnwindSegueReportTable]) {
        [self save];
    }
}

- (IBAction)unwindToReportVC:(UIStoryboardSegue *)segue
{
    NSString *segueId = segue.identifier;
    NSLog(@"Unwind Segue:%@", segueId);
    if ([segue.sourceViewController isKindOfClass:[STREditArticleViewController class]]) {
        [self configureView];
    }
}

@end
