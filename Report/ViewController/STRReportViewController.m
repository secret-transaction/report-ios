//
//  STRReportViewController.m
//  Report
//
//  Created by Lyndon Michael Bibera on 7/10/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

#import "STRReportViewController.h"

@interface STRReportViewController ()

@end

@implementation STRReportViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapToEditArticle:(id)sender
{
    [self performSegueWithIdentifier:@"ReportToArticleSegue" sender:self];
}

- (IBAction)tapToEditImages:(id)sender
{
    [self performSegueWithIdentifier:@"ReportToImagesSegue" sender:self];
}

@end
