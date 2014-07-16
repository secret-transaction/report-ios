//
//  STREditArticleViewController.m
//  Report
//
//  Created by Lyndon Michael Bibera on 7/10/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

#import "STREditArticleViewController.h"

@interface STREditArticleViewController ()

@end

@implementation STREditArticleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)configureView
{
    if (self.report) {
        self.editTitle.text = self.report.title;
        self.editDetails.text = self.report.detail;
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue:%@", segue.identifier);
    if ([segue.identifier isEqualToString:UnwindSegueReport] ) {
        Report *r = self.report;
        r.title = self.editTitle.text;
        r.detail = self.editDetails.text;
    }
}

@end
