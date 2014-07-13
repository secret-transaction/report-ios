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
    if (self.report) {
        self.editTitle.text = self.report.title;
        self.editDetails.text = self.report.detail;
    }
}

- (IBAction)done:(UIBarButtonItem *)sender
{
    NSLog(@"Done");
    self.report.title = self.editTitle.text;
    self.report.detail = self.editDetails.text;
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
